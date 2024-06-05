from nameko.extensions import DependencyProvider
from datetime import datetime,timedelta

import mysql.connector
from mysql.connector import Error
from mysql.connector import pooling

import json

class DatabaseWrapper:

    connection = None
    
    def __init__(self,connection):
        self.connection = connection

    # G -> GET
    # P -> POST
    # U -> PUT (UPDATE)
    # D -> DELETE
    
    # G, P, U, D /user/<userId>
    # G -> verif nama (userId)
    # P -> buat akun (username,name,gmail,tgl_ultah,no_telp,gender,kota,negara,password)
    # U -> update profile (tgl_ultah,no_telp,gender,kota,negara)
    # D -> delete/disable account (userId) -> ubah status ke 0 | 1 = aktif, 0 = nonaktif
    
    # P /user/auth
    # P -> login
    
    # P, U /user/forgot
    # P -> request forgot pass (gmail)
    # U -> ubah password (userID, new pass, kode_ganti_pass)

# =========================================================================== /USER/ ===========================================================================

    # G | /user/<userId> | verif nama
    def verif_user_name(self, userid):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek username + gmail
            sql = str("SELECT * FROM `user` WHERE `user_id` = {}".format((userid)))
            cursor.execute(sql)
            existing_user = cursor.fetchone()
            if existing_user is None:
                # tidak ada username atau gmail yang terdaftar
                return 400, {
                    "status":"Failed",
                    "detail":f"No account with id : {str(userid)}",
                    "code":400
                }
            else:
                # username ada terdaftar 
                # konversi ke string
                existing_user['tgl_ultah'] = str(existing_user['tgl_ultah'])
                return 200, existing_user
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error getting user: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()

    # P | /user/<userId> | buat user baru - sign up
    def create_user(self,username,name,gmail,tgl_ultah,no_telp,gender,kota,negara,password):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek username + gmail
            sql = "SELECT * FROM user WHERE username = '{}' OR email = '{}'".format(username,gmail)
            cursor.execute(sql)
            existing_user = cursor.fetchone()
            if existing_user is not None:
                # username/gmail sudah pernah terpakai
                return 409, {
                    "status":"Failed",
                    "detail":f"username or gmail is already registered",
                    "code":409
                }
            else:
                try:
                    # buat userId terbaru
                    cursor.execute("SELECT COUNT(*) FROM user")
                    total_records = cursor.fetchone()['COUNT(*)']
                    new_user_id = total_records + 1
                    # username/gmail belum pernah terpakai
                    tgl_ultah = str(tgl_ultah)
                    sql = """INSERT INTO `user` (`user_id`, `user_status`, `name`, `username`, `email`, `jenis`, `password`, `tgl_ultah`, `no_telp`, `gender`, `kota`, `negara`) VALUES ('{}', 1, '{}', '{}', '{}', 1, '{}', '{}', '{}', '{}', '{}', '{}')""".format(new_user_id, name, username, gmail, password, tgl_ultah, no_telp, gender, kota, negara)
                    cursor.execute(sql)
                    self.connection.commit()
                    return 200, {
                        "status":"Success",
                        "detail":f"User {username} created succesffully",
                        "code":200
                    }
                except Exception as e:
                    return 400, {
                        "status": "Failed",
                        "detail": f"Error creating user: {str(e)}",
                        "code": 400
                    }
                finally:
                    cursor.close()
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error creating user: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()

    # U | /user/<userId> | update profile
    def update_profile(self, userid, name, username, tgl_ultah, no_telp, gender, kota, negara):
        # gmail tidak bisa diubah 
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek gmail dulu baru di update
            sql = "SELECT * FROM user WHERE user_id = {}".format(userid)
            cursor.execute(sql)
            user_detail = cursor.fetchone()
            if user_detail is None:
                return 400, {
                    "status": "Failed",
                    "detail": f"No user found with ID: {userid}",
                    "code": 400
                }
            else:
                tgl_ultah = str(tgl_ultah)
                sql2 = "UPDATE `user` SET `name` = '{}', `username` = '{}', `tgl_ultah` = '{}', `no_telp` = '{}', `gender` = '{}', `kota` = '{}', `negara` = '{}' WHERE `user`.`user_id` = {};".format(username, name, tgl_ultah, no_telp, gender, kota, negara, userid)
                try:
                    cursor.execute(sql2)
                    self.connection.commit()
                    
                    if cursor.rowcount == 0:
                        return 400, {
                            "status": "Failed",
                            "detail": "No rows updated. User profile might not exist.",
                            "code": 400
                        }
                    else:
                        return 200, {
                            "status": "Success",
                            "detail": "User profile updated successfully",
                            "code": 200
                        }
                except Exception as e:
                    return 400, {
                        "status": "Failed",
                        "detail": f"Error executing update SQL query: {str(e)}",
                        "code": 400
                    }
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error updating user profile: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()

    # D -> PUT | /user/<userId> | disable/delete account -> status jadi 0
    def delete_acc(self,userid):
        # gmail tidak bisa diubah 
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek gmail dulu baru di update
            sql = "SELECT * FROM user WHERE user_id = {}".format(userid)
            cursor.execute(sql)
            user_detail = cursor.fetchone()
            if user_detail is None:
                return 400, {
                    "status": "Failed",
                    "detail": f"No user found: {str(e)}",
                    "code": 400
                }
            else:
                sql = "UPDATE user SET `user_status` = 0 WHERE user_id = {}".format(userid)
                cursor.execute(sql)
                self.connection.commit()
                return 200, {
                    "status": "Success",
                    "detail": f"user profile updated succesfully",
                    "code": 200
                }
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error updating user profile: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()
    
# =========================================================================== /USER/AUTH ===========================================================================
    
    # P | /user/auth/<gmail> | login
    def verif_login(self, gmail, password):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek username + gmail
            sql = "SELECT username,password FROM user WHERE email = {} AND password = {}"
            cursor.execute(sql, (gmail,password))
            existing_user = cursor.fetchone()
            if existing_user:
                # tidak ada username atau gmail yang terdaftar
                return 400, {
                    "status":"Failed",
                    "detail":f"No account registered with {input}",
                    "code":400
                }
            else:
                # username ada terdaftar 
                return 200, existing_user
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error getting user: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()

# =========================================================================== /USER/FORGOT ===========================================================================

    # request forgot password
    def request_forgot_pass(self,gmail):
        cursor = self.connection.cursor(dictionary=True)
        try:
            sql = "SELECT * FROM user WHERE email = {}"
            cursor.execute(sql, (gmail))
            existing_user = cursor.fetchone() 
            if existing_user:
                # tidak ada gmail terdaftar
                return 400, {
                    "status": "Failed",
                    "detail": f"No account registered with : {gmail}",
                    "code": 400
                }
            else:
                # ada gmail terdaftar
                sql = "UPDATE user SET request_acc_forgot = 1, request_forgot_date = GETDATE() WHERE gmail = {}"
                cursor.execute(sql, (gmail))
                return 200, {
                    "status": "Success",
                    "detail": f"forgot password is requested for : {gmail}",
                    "code": 200
                }
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error requesting forgot password: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()

    # update password - change pass/forgot pass
    def update_pass(self,gmail,password,kode_ganti_pass):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek gmail
            sql = "SELECT * FROM user WHERE email = {}"
            cursor.execute(sql, (gmail))
            existing_user = cursor.fetchone()
            if existing_user:
                # tidak ada username atau gmail yang terdaftar
                return 400, {
                    "status":"Failed",
                    "detail":f"No account registered",
                    "code":400
                }
            else:
                # username terdaftar, cek kalo betulan request ubah pass
                if existing_user['request_acc_forgot'] == 0:
                    # tidak ada request
                    return 400, {
                        "status":"Failed",
                        "detail":f"No request for username with {existing_user['username']}",
                        "code":400
                    }
                else:
                    # ada request
                    # cek hari nya udah 1 minggu atau belum, > 1 minggu = tolak
                        forgot_date = existing_user['request_forgot_date'].date()
                        today = datetime.now().date()
                        
                        time_dif = today - forgot_date

                        if time_dif > timedelta(days=7):
                            # tolak forgot pass
                            return 400, {
                                "status":"Failed",
                                "detail":f"No request for username with {existing_user['username']}",
                                "code":400
                            }
                        else:
                            # terima forgot pass
                            # cek kode sama atau tidak
                            if existing_user["request_forgot_code"] == kode_ganti_pass:
                                sql = "UPDATE user SET password = {}, request_acc_forgot = 0 WHERE email = {}"
                                cursor.execute(sql, (password,gmail))
                                return 200, {
                                    "status":"Success",
                                    "detail":f"Password succesfully change for username {existing_user['username']}",
                                    "code":200
                                }
                            else:
                                return 400, {
                                    "status":"Failed",
                                    "detail":f"Code is different",
                                    "code":400
                                }
        except Exception as e:
            return 400, {
                    "status":"Failed",
                    "detail":f"Error changing password {str(e)}",
                    "code":400
                }
        finally:
            cursor.close()

# =========================================================================== MISC ===========================================================================

    # ambil semua data user (semua user)
    def get_all_user(self):
        cursor = self.connection.cursor(dictionary=True)
        try:
            sql = "SELECT * FROM user"
            cursor.execute(sql)
            all_user = cursor.fetchall()
            for user in all_user:
                user['tgl_ultah'] = user['tgl_ultah'].isoformat()
            return 200, json.dumps(all_user)
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error getting all user: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()
    
    def __del__(self):
        self.connection.close()

class Database(DependencyProvider):

    connection_pool = None

    def __init__(self):
        try:
            self.connection_pool = mysql.connector.pooling.MySQLConnectionPool(
                pool_name="database_pool",
                pool_size=10,
                pool_reset_session=True,
                host='localhost',
                database='soa_utama',
                user='root',
                password=''
            )
        except Error as e :
            print ("Error while connecting to MySQL using Connection pool ", e)

    def get_dependency(self, worker_ctx):
        return DatabaseWrapper(self.connection_pool.get_connection())