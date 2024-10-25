
FactoryGirl.define do
  factory :pv_emission, :class => Refinery::PvEmissions::PvEmission do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

