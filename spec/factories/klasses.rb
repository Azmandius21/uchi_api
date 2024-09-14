FactoryBot.define do
  factory :klass do
    number { 1 }
    letter { "MyString" }
    students_count { 1 }
    school { nil }
  end
end
