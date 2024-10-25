
FactoryGirl.define do
  factory :pv_interest_link, :class => Refinery::PvInterestLinks::PvInterestLink do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

