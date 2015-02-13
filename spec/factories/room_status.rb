FactoryGirl.define do
  factory :room_status do
    sequence(:room_id){|n| "#{n}" }
    sequence(:time){|n| Time.now }
  end
end