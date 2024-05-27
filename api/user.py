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
    
    # update password
    @rpc
    def update_pass(self,gmail,password):
        status_code, update_detail = self.database.update_pass(gmail,password)
        return status_code,update_detail