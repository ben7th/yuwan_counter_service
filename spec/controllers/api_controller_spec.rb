require 'rails_helper'

describe ApiController do

  describe "接收 HTTP post 数据" do
    it '数量正确' do
      post :chat_lines, 
            chat_lines: {
            "0" => {
              room_id: 11, 
              manager: 'jane', 
              text: 'i speak', 
              username: 'xiaohong', 
              userlevel: '21', 
              talk_time: Time.now,
              chat_type: 'chat'
            },

            "1" => {
              room_id: 11, 
              manager: 'jane', 
              text: 'i speak', 
              username: 'xiaohong', 
              userlevel: '21', 
              talk_time: Time.now,
              chat_type: 'chat'
            }
          }

          
      expect(ChatLine.all.length).to eq(2)

    end
  end



  describe "统计数据" do

    describe "类型" do
      before {
        types = ['chat', 'welcome', 'forbid', 'yuwan']

        Timecop.travel(Time.now - 1.day) do
          
          3.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => types[i])
          end

        end

        Timecop.travel(Time.now - 5.day) do
          
          4.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => types[i])
          end

        end

        Timecop.travel(Time.now - 20.day) do
          
          3.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => types[i])
          end

        end
      }

      it '准备数据' do
        expect(ChatLine.all.length).to eq(10)
      end
    end
    
  end

  
  
end

