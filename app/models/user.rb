class User < ApplicationRecord
    has_many :favorites
    has_many :areas, through: :favorites
end
