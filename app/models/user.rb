class User < ActiveRecord::Base
    has_secure_password
    has_many :todos
    validates :email, uniqueness: true
    validates :email, presence: true


    # def password=(password)
    #     # password string
    #     # encrypting it with salts hashes
    #     # set the user password_digest to the encrypted string 
    # end

end

