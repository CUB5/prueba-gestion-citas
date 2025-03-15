class Cliente < ApplicationRecord
    belongs_to :user

    validates :codigo, presence: true, uniqueness: true
end
