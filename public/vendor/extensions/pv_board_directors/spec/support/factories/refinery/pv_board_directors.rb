
FactoryGirl.define do
  factory :pv_board_director, :class => Refinery::PvBoardDirectors::PvBoardDirector do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

