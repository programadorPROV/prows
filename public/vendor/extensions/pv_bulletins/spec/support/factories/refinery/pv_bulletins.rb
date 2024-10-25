
FactoryGirl.define do
  factory :pv_bulletin, :class => Refinery::PvBulletins::PvBulletin do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

