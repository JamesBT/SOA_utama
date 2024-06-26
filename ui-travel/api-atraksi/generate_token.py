import jwt

SECRET_KEY = 'pisang goreng'

def generate_token(payload):
    return jwt.encode(payload, SECRET_KEY, algorithm='HS256')

# def verify_token( token):
#         try:
#             payload = jwt.decode(token, SECRET_KEY, algorithms=['HS256'])
#             return payload
#         except jwt.ExpiredSignatureError:
#             return {"error": "Token has expired"}
#         except jwt.InvalidTokenError:
#             return {"error": "Invalid token"}

# def create_ticket_with_token( token):
#         token_data = verify_token(token)
#         if 'error' in token_data:
#             return token_data
#         return token_data

if __name__ == '__main__':
    payload = {'user_id': "tipen"}
    
    # Generate the token
    token = generate_token(payload)
    print(token);

    