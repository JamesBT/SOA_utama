from nameko.exceptions import registry

def remote_error(exc_path):
    
    def wrapper(exc_type):
        registry[exc_path] = exc_type
        return exc_type
    
    return wrapper

@remote_error('users.exception.NotFound')
class UserNotFound(Exception):
    pass