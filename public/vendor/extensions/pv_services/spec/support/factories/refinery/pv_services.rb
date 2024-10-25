
FactoryGirl.define do
  factory :pv_service, :class => Refinery::PvServices::PvService do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

