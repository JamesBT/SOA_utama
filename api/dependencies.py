from nameko.extensions import DependencyProvider
from datetime import datetime,timedelta

import mysql.connector
from mysql.connector import Error
from mysql.connector import pooling

class DatabaseWrapper:

    connection = None
    
    def __init__(self,connection):
        self.connection = connection

    # buat user baru - sign up
    def create_user(self,username,name,gmail,tgl_ultah,no_telp,gender,kota,negara,password):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek username + gmail
            sql = "SELECT * FROM user WHERE username = {} OR email = {}"
            cursor.execute(sql, (username, gmail,))
            existing_user = cursor.fetchone()

            if existing_user:
                # username/gmail sudah pernah terpakai
                return 409, {
                    "status":"Failed",
                    "detail":f"username or gmail is already registered",
                    "code":409
                }
            else:
                try:
                    # username/gmail belum pernah terpakai
                    sql = "INSERT INTO user (username, name, gmail, jenis, password, tgl_ultah, no_telp, gender, kota, negara) VALUES ({},{},{},1,{},{},{},{},{},{})"
                    cursor.execute(sql, (username,name,gmail,password,tgl_ultah,no_telp,gender,kota,negara))
                    self.connection.commit()

                    return 200, {
                        "status":"Success",
                        "detail":f"User {username} created succesffully",
                        "code":200
                    }
                except Exception as e:
                    return 400, {
                        "status":"Failed",
                        "detail":f"Error creating user",
                        "code":400
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

    # ambil user dengan username/gmail tertentu - untuk login/sign in
    def get_user(self, input):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek username + gmail
            sql = "SELECT username,password FROM user WHERE username = {} OR email = {}"
            cursor.execute(sql, (input,input))
            existing_user = cursor.fetchone()
            if existing_user:
                # tidak ada username atau gmail yang terdaftar
                return 400, {
                    "status":"Failed",
                    "detail":f"No username or gmail is registered with {input}",
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

    # ambil data full user id tertentu
    def get_user_detail(self, input):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek username + gmail
            sql = "SELECT * FROM user WHERE username = {} OR email = {}"
            cursor.execute(sql, (input,input))
            existing_user = cursor.fetchone()
            if existing_user:
                # tidak ada username atau gmail yang terdaftar
                return 400, {
                    "status":"Failed",
                    "detail":f"No username or gmail is registered with {input}",
                    "code":400
                }
            else:
                # username ada terdaftar 
                return 200, existing_user
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error getting user detail: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()
            
    # ambil semua data user (semua user)
    def get_all_user(self):
        cursor = self.connection.cursor(dictionary=True)
        try:
            sql = "SELECT * FROM user"
            cursor.execute()
            all_user = cursor.fetchone()
            return 200, all_user
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error getting all user: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()
            
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
    def update_pass(self,gmail,password):
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
                    "detail":f"No username or gmail is registered with {gmail}",
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
                            print("lebih dari 1 minggu")
                            return 400, {
                                "status":"Failed",
                                "detail":f"No request for username with {existing_user['username']}",
                                "code":400
                            }
                        else:
                            # terima forgot pass
                            print("kurang dari 1 minggu")
                            sql = "UPDATE user SET password = {}, request_acc_forgot = 0 WHERE email = {}"
                            cursor.execute(sql, (password,gmail))
                            return 200, {
                                "status":"Success",
                                "detail":f"Password succesfully change for username {existing_user['username']}",
                                "code":200
                            }
        except Exception as e:
            return 400, {
                    "status":"Failed",
                    "detail":f"Error changing password {str(e)}",
                    "code":400
                }
        finally:
            cursor.close()
    
    # update data profile
    def update_profile(self,gmail,name,username,tgl_ultah,no_telp,gender,kota,negara):
        # gmail tidak bisa diubah 
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek gmail dulu baru di update
            sql = "SELECT * FROM user WHERE email = {}"
            cursor.execute(sql, (gmail))
            user_detail = cursor.fetchone()
            if user_detail:
                return 400, {
                    "status": "Failed",
                    "detail": f"No user found: {str(e)}",
                    "code": 400
                }
            else:
                sql = "UPDATE user SET username = {}, name = {}, tgl_ultah = {}, no_telp = {}, gender = {}, kota = {}, negara = {} WHERE email = {}"
                cursor.execute(sql, (username,name,tgl_ultah,no_telp,gender,kota,negara,gmail))
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

    # verif berdasarkan nama
    def verif_user_name(self,name):
        cursor = self.connection.cursor(dictionary=True)
        try:
            # cek username + gmail
            sql = "SELECT username FROM user WHERE name = {}"
            cursor.execute(sql, (name))
            existing_user = cursor.fetchone()
            if existing_user:
                # tidak ada username atau gmail yang terdaftar
                return 400, {
                    "status":"Failed",
                    "detail":f"No user registered with name {name}",
                    "code":400
                }
            else:
                # username ada terdaftar 
                return 200, {
                    "status":"Success",
                    "detail":f"User is registered",
                    "code":400
                }
        except Exception as e:
            return 400, {
                "status": "Failed",
                "detail": f"Error getting user: {str(e)}",
                "code": 400
            }
        finally:
            cursor.close()

    # delete user

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
                database='hotel',
                user='root',
                password=''
            )
        except Error as e :
            print ("Error while connecting to MySQL using Connection pool ", e)

    def get_dependency(self, worker_ctx):
        return DatabaseWrapper(self.connection_pool.get_connection())