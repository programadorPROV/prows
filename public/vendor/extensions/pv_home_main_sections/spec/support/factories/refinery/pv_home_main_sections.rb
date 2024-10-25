
FactoryGirl.define do
  factory :pv_home_main_section, :class => Refinery::PvHomeMainSections::PvHomeMainSection do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

