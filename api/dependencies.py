from nameko.extensions import DependencyProvider

import mysql.connector
from mysql.connector import Error
from mysql.connector import pooling

class DatabaseWrapper:

    connection = None
    
    def __init__(self,connection):
        self.connection = connection

    # buat user baru - sign up
    def create_user(self,username,name,gmail,password):
        cursor = self.connection.cursor(dictionary=True)
        # cek username + gmail
        sql = "SELECT * FROM user WHERE username = {} OR email = {}"
        cursor.execture(sql, (username, gmail,))
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
                sql = "INSERT INTO user (username, name, gmail, password) VALUES ({},{},{},{})"
                cursor.execute(sql, (username,name,gmail,password))
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

    # ambil user dengan username/gmail tertentu - untuk login/sign in
    def get_user(self, input):
        cursor = self.connection.cursor(dictionary=True)
        # cek username + gmail
        sql = "SELECT username,password FROM user WHERE username = {} OR email = {}"
        cursor.execture(sql, (input,input))
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

    # ambil data full user id tertentu
    def get_user_detail(self, input):
        cursor = self.connection.cursor(dictionary=True)
        # cek username + gmail
        sql = "SELECT * FROM user WHERE username = {} OR email = {}"
        cursor.execture(sql, (input,input))
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

    # update password - change pass/forgot pass
    def update_pass(self,gmail,password):
        cursor = self.connection.cursor(dictionary=True)
        # cek gmail
        sql = "SELECT gmail FROM user WHERE email = {}"
        cursor.execture(sql, (gmail))
        existing_user = cursor.fetchone()
        if existing_user:
            # tidak ada username atau gmail yang terdaftar
            return 400, {
                "status":"Failed",
                "detail":f"No username or gmail is registered with {gmail}",
                "code":400
            }
        else:
            # cek kalo betulan request ubah pass

            

            # username ada terdaftar 
            return 200, existing_user

    # update data profile

    # delete data



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