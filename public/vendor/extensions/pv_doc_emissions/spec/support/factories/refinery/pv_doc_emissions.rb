
FactoryGirl.define do
  factory :pv_doc_emission, :class => Refinery::PvDocEmissions::PvDocEmission do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

