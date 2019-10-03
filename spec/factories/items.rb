FactoryBot.define do
  factory :item do
    association :merchant, factory: :merchant
    sequence(:name) {|n| "Hi im item and my name is #{n}"}
    sequence(:description) {|n| "description #{n}"}
    sequence(:unit_price) {|n| "{n}".to_i + 3} 
  end
end
