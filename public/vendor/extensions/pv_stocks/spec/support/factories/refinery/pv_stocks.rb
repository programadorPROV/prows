
FactoryGirl.define do
  factory :pv_stock, :class => Refinery::PvStocks::PvStock do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

