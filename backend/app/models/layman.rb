class Layman < ApplicationRecord
     has_many :questions, dependent: :destroy
     has_many :elabs, through: :questions
     has_many :questions, through: :elabs
end
