class Cliente < ApplicationRecord
    belongs_to :user
    has_many :citas, dependent: :destroy
    
    validates :codigo, presence: true, uniqueness: true
end
