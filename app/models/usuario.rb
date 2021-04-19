class Usuario < ApplicationRecord
    belongs_to :user

    has_many :nome

    def is_belongs_to? user
        User.find_by(user_id: user.id, id: id)
    end
end
