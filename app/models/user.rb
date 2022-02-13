class User < ApplicationRecord

    has_secure_password validations: true

    validates :email, presence: true, uniqueness: true
    
    def self.search(search) #self.でクラスメソッドとしている
        if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
            User.where(['name LIKE ?', "%#{search}%"])
        else
            User.all #全て表示。
        end
    end
end
