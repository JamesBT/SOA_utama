from nameko.rpc import rpc

import dependencies

class userService:

    name = 'user_service'

    database = dependencies.Database()

    # buat akun user baru
    @rpc
    def create_user(self,username,name,gmail,password):
        status_code, create_details = self.database.create_user(username,name,gmail,password)
        return status_code, create_details
    
    # ambil user berdasarkan gmail/username
    @rpc 
    def get_user(self,input):
        status_code, user_detail = self.database.get_user(input)
        return status_code, user_detail
    
    # ambil detail full user berdasarkan gmail/username
    @rpc 
    def get_user_detail(self,input):
        status_code, user_detail = self.database.get_user_detail(input)
        return status_code, user_detail
    
    # ambil semua user
    @rpc
    def get_all_user(self):
        status_code,all_user = self.database.get_all_user()
        return status_code,all_user
    
    # request forgot pass
    @rpc
    def request_forgot_pass(self,gmail):
        status_code, request_detail = self.database.request_forgot_pass(gmail)
        return status_code, request_detail
    
    # update password
    @rpc
    def update_pass(self,gmail,password):
        status_code, update_detail = self.database.update_pass(gmail,password)
        return status_code, update_detail
    
    # update data profile
    def update_profile(self,gmail,name,username,tgl_ultah,no_telp,gender,kota,negara):
        status_code, update_status = self.database.update_profile(gmail,name,username,tgl_ultah,no_telp,gender,kota,negara)
        return status_code, update_status
    
    # verif berdasarkan nama 
    def verif_user_name(self,name):
        status_code, verif_detail = self.database.verif_user_name(self,name)
        return status_code, verif_detail
    