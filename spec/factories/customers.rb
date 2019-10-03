FactoryBot.define do
  factory :customer do
    sequence :last_name{|n| "Hi my last name is #{n}"}
    sequence :first_name{|n| "Hi my first name is #{n}"}
  end
end 
