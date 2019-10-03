FactoryBot.define do
  factory :transaction do
    association :invoice, factory: :invoice
    sequence(:credit_card_number) { |n| (n + 1234567890000000).to_s }
    credit_card_expiration_date {"2000-01-99"}
    result{"success"}
  end
end 
