class School < ApplicationRecord
  has_many :klasses
  has_many :students
end
