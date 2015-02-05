FactoryGirl.define do
  factory :chat_line do
    sequence(:room_id){|n| "#{n}" }
    sequence(:manager){|n| "manager_#{n}" }
    sequence(:text){|n| "text_#{n}" }
    sequence(:username){|n| "username_#{n}" }
    sequence(:userlevel){|n| "userlevel_#{n}" }
    sequence(:talk_time){|n| Time.now }
    sequence(:chat_type){|n| "chat" }
  end
end