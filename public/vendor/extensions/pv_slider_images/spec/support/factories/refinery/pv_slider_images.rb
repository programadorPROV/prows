
FactoryGirl.define do
  factory :pv_slider_image, :class => Refinery::PvSliderImages::PvSliderImage do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

