FactoryBot.define do
  factory :student do
    first_name { "MyString" }
    last_name { "MyString" }
    surname { "MyString" }
    school { nil }
    klass { nil }
  end
end
