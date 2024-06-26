import json
from nameko.extensions import DependencyProvider
import mysql.connector
from mysql.connector import Error
from mysql.connector import pooling
from datetime import datetime
import string
import random
import boto3
from botocore.exceptions import NoCredentialsError, PartialCredentialsError, ClientError, EndpointConnectionError


class DatabaseWrapper:

    connection = None
    atraksi_id = 1
    # kalau eror ini di comment aja
    BUCKET_NAME = 'soa-dufan'
    s3 = boto3.client('s3')
    # # comment sampe sini

    def __init__(self, connection):
        self.connection = connection
    
    def get_atraksi_photo(self):
        cursor = self.connection.cursor(dictionary=True)
        result = []
        # print(self.atraksi_id)
        sql = "SELECT placeholder, image FROM photos WHERE atraksi_id={0}".format(self.atraksi_id)
        cursor.execute(sql)
        for row in cursor.fetchall():
            data = row
            result.append(data)
        cursor.close()
        return result
    
    # kalau eror ini di comment aja
    def get_atraksi_photo_s3(self):
        result = None
        try:
            response = self.s3.list_objects_v2(Bucket=self.BUCKET_NAME)
            result = []
            for obj in response['Contents']:
                # print(obj)
                key = obj['Key'].replace(" ", "+")
                url = "https://{0}.s3.amazonaws.com/{1}".format(self.BUCKET_NAME, key)
                result.append(url)
        except NoCredentialsError:
            result = {"error": "No AWS credentials were provided."}
        except PartialCredentialsError:
            result = {"error": "Incomplete AWS credentials provided."}
        except EndpointConnectionError:
            result = {"error": "Could not connect to the specified endpoint."}
        except ClientError as e:
            # Handle any client error thrown by boto3
            result = {"error": str(e)}
        except Exception as e:
            # Catch any other exceptions
            result = {"error": str(e)}
        return result
    # comment sampe sini
    
    def get_ticket_type_id(self, type_id):
        cursor = self.connection.cursor(dictionary=True)
        result = None
        # print(self.atraksi_id)
        sql = "SELECT name FROM types WHERE id={0}".format(type_id)
        cursor.execute(sql)
        result = cursor.fetchone()
        cursor.close()
        return result['name']
    
    def get_atraksi_jam_buka(self):
        cursor = self.connection.cursor(dictionary=True)
        result = []
        # print(self.atraksi_id)
        sql = "SELECT hari, waktu, is_open FROM jam_bukas WHERE atraksi_id={0}".format(self.atraksi_id)
        cursor.execute(sql)
        for row in cursor.fetchall():
            data = row
            result.append(data)
        cursor.close()
        return result
    
    def get_atraksi_info(self):
        cursor = self.connection.cursor(dictionary=True)
        result = None
        sql = "SELECT id AS atraksi_id, title, slug, deskripsi, info_penting, highlight, alamat, provinsi, provinsi_name, kota, kota_name, gps_location, lowest_price, is_active FROM atraksis WHERE id={0} AND is_active=true".format(self.atraksi_id)
        # print(sql)
        cursor.execute(sql)
        for row in cursor.fetchall():
            data = row
            # data['photo'] = get_atraksi_photo(4)
            # result.append(data)
            result = data
        cursor.close()
        return result
    
    def get_atraksi_paket(self):
        cursor = self.connection.cursor(dictionary=True)
        result = {}
        paket = []
        sql = "SELECT p.id AS paket_id, p.atraksi_id, p.type_id, t.name as type_name, p.title, p.deskripsi, p.fasilitas, p.cara_penukaran, p.syarat_dan_ketentuan, p.harga, p.kuota, p.is_refundable FROM pakets p JOIN types t ON p.type_id = t.id WHERE p.atraksi_id = %s"
        cursor.execute(sql, (self.atraksi_id,))
        for row in cursor.fetchall():
            data = row
            paket.append(data)
        cursor.close()
        result['paket'] = paket
        return result
    
    def get_atraksi_paket_id(self, id_paket):
        cursor = self.connection.cursor(dictionary=True)
        paket = None
        sql = "SELECT id AS paket_id, atraksi_id, type_id, title, deskripsi, fasilitas, cara_penukaran, syarat_dan_ketentuan, harga,kuota, is_refundable FROM pakets WHERE id= %s"
        cursor.execute(sql, [id_paket])
        paket = cursor.fetchone()
        cursor.close()
        return paket
    
    def get_atraksi_tutup(self, tgls):
        cursor = self.connection.cursor(dictionary=True)
        result = None
        sql = "SELECT tgl FROM tgl_tutups WHERE tgl = %s"
        cursor.execute(sql, [tgls])

        for row in cursor.fetchall():
            # print(f"Database date: {result}, Input date: {tgls}")
            
            result = row['tgl']
            if isinstance(result, str):
                result = datetime.strptime(result, '%Y-%m-%d').date()
            if isinstance(tgls, str):
                tgls = datetime.strptime(tgls, '%Y-%m-%d').date()
                
            if result == tgls:
                return {"status": "Tutup"}

        cursor.close()
        return {"status": "Buka"}
      
    

    
    def generate_random_string(self, length=6):
        letters = string.ascii_uppercase + string.digits
        result = ''.join(random.choice(letters) for i in range(length))
        # print(result)
        return result
    
    def create_eticket(self, paket_id, jml_ticket, booking_code, jenis, tgl_booking):
        cursor = self.connection.cursor(dictionary=True)
        created_at = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        valid_at = tgl_booking
        ticket_code = self.generate_random_string()
        response = None
        try:
            sql = "INSERT INTO etickets (booking_code, ticket_code, paket_id, jenis, created_at, valid_at, check_in) VALUES (%s, %s, %s, %s, %s, %s, NULL);"
            # print(sql);
            cursor.execute(sql, [booking_code, ticket_code, paket_id, jenis, created_at, valid_at])
            self.connection.commit()
            
            response = {
                'ticket_code': ticket_code,
                'booking_code': booking_code,
                'paket_id': paket_id,
                'jenis': jenis,
                'created_at': created_at,
                'valid_at': valid_at,
            }
        except mysql.connector.Error as e:
            
            self.connection.rollback()
            response = {
                'code': 400,
                'response': str(e)
            }
            
        return response
    
    def get_eticket_detail(self,ticket_code):
        cursor = self.connection.cursor(dictionary=True)
        sql = "SELECT * FROM etickets WHERE ticket_code=%s"
        cursor.execute(sql, (ticket_code,))
        eticket = cursor.fetchone()
        cursor.close()
        return eticket
    
    def check_in(self, ticket_code):
        cursor = self.connection.cursor(dictionary=True)
        check_in = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
        
        try:
            sql = "UPDATE etickets SET check_in = %s WHERE ticket_code = %s;"
            cursor.execute(sql, [check_in, ticket_code])
            self.connection.commit()
            
            if cursor.rowcount > 0:
                response  = {
                    "ticket_code": ticket_code,
                    "check_in" : check_in,
                }
            else:
                response  = {
                    "error": "check in gagal"
                }
        except Error as e:
            self.connection.rollback()
            response = {
                'error': str(e)
            }
        
        return response
        
    def delete_eticket(self, ticket_code):
        cursor = self.connection.cursor(dictionary=True)
        try:
            sql = "DELETE FROM etickets WHERE ticket_code = %s"
            cursor.execute(sql, (ticket_code,))
            self.connection.commit()
            result = cursor.rowcount
        except Error as e:
            print("Error while deleting e-ticket", e)
            result = None
        finally:
            cursor.close()
        return result
    
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
                database='atraksi_soa',
                user='root',
                password=''
            )
        except Error as e :
            print ("Error while connecting to MySQL using Connection pool ", e)

    def get_dependency(self, worker_ctx):
        return DatabaseWrapper(self.connection_pool.get_connection())
