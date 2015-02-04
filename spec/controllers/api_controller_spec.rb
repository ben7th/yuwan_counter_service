require 'rails_helper'

describe ApiController do
  before {
  }

  it '接收 HTTP post 数据' do
    post :chat_lines, 
          chat_lines: [
          {
            room_id: 11, 
            manager: 'jane', 
            text: 'i speak', 
            username: 'xiaohong', 
            userlevel: '21', 
            talk_time: Time.now,
            chat_type: 'chat'
          },

          {
            room_id: 11, 
            manager: 'jane', 
            text: 'i speak', 
            username: 'xiaohong', 
            userlevel: '21', 
            talk_time: Time.now,
            chat_type: 'chat'
          }
        ]

        
    expect(ChatLine.all.length).to eq(2)

  end
  
end