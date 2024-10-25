
FactoryGirl.define do
  factory :pv_document, :class => Refinery::PvDocuments::PvDocument do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

