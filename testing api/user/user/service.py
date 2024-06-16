from nameko.rpc import rpc

from user import dependencies

class userService:

    name = 'user_service'

    database = dependencies.Database()

# =========================================================================== /USER/ ===========================================================================

    # verif berdasarkan nama 
    @rpc
    def verif_user_name(self,userid):
        status_code, verif_detail = self.database.verif_user_name(userid)
        return status_code, verif_detail
    
    # buat akun user baru
    @rpc
    def create_user(self,username,name,gmail,tgl_ultah,no_telp,gender,kota,negara,password):
        status_code, create_details = self.database.create_user(username,name,gmail,tgl_ultah,no_telp,gender,kota,negara,password)
        print("BUAT USER")
        return status_code, create_details
    
    # update data profile
    @rpc
    def update_profile(self,userid,name,username,tgl_ultah,no_telp,gender,kota,negara):
        status_code, update_status = self.database.update_profile(userid,name,username,tgl_ultah,no_telp,gender,kota,negara)
        return status_code, update_status
    
    # delete account
    @rpc
    def delete_acc(self,userid):
        status_code, delete_status = self.database.delete_acc(userid)
        return status_code, delete_status
    
# =========================================================================== /USER/AUTH ===========================================================================    

    # ambil user berdasarkan gmail/username
    @rpc 
    def verif_login(self,gmail,password):
        status_code, user_detail = self.database.verif_login(gmail,password)
        return status_code, user_detail
    
# =========================================================================== /USER/FORGOT ===========================================================================    
    
    # request forgot pass
    @rpc
    def request_forgot_pass(self,gmail):
        status_code, request_detail = self.database.request_forgot_pass(gmail)
        return status_code, request_detail
    
    # update password
    @rpc
    def update_pass(self,gmail,password,kode_ganti_pass):
        status_code, update_detail = self.database.update_pass(gmail,password,kode_ganti_pass)
        return status_code, update_detail

# =========================================================================== MISC ===========================================================================    

    # ambil semua user
    @rpc
    def get_all_user(self):
        status_code,all_user = self.database.get_all_user()
        return status_code,all_user
    
    
    