class Student < ApplicationRecord
  belongs_to :school
  belongs_to :klass
end
