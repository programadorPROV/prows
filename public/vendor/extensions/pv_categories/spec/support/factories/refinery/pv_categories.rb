
FactoryGirl.define do
  factory :pv_category, :class => Refinery::PvCategories::PvCategory do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

