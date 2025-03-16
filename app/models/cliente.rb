class Cliente < ApplicationRecord
    belongs_to :user
    has_many :citas
    
    validates :codigo, presence: true, uniqueness: true
end
