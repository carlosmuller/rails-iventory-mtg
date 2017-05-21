class User < ApplicationRecord
  has_secure_token :public_api_key
end
