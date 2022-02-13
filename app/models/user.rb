class User < ApplicationRecord

    has_secure_password 

    def self.search(query)
    end

end
