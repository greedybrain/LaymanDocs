require "JWT"
require "pry"

class Auth 

     def self.encode_token(layman_object)
          payload = { layman: layman_object }
          JWT.encode(payload, ENV['JWT_TOKEN_SECRET'], ENV['JWT_ALGORITHM'])
     end

     def self.decode_token(token)
          JWT.decode(token, ENV['JWT_TOKEN_SECRET'], true, { :algorithm => ENV['JWT_ALGORITHM'] })
     end

end
