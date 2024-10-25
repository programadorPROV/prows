
FactoryGirl.define do
  factory :pv_faq, :class => Refinery::PvFaqs::PvFaq do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

