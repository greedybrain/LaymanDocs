require "JWT"
require "pry"

class Auth 

     def self.encode_token(layman_object)
          payload = { layman: layman_object }
          JWT.encode(payload, secret, "HS256")
     end

     def self.decode_token
     end

end
