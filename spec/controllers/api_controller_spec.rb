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
            FactoryGirl.create(:chat_line, :room_id => '1', :chat_type => types[i])
          end

        end

        Timecop.travel(Time.now - 5.day) do
          
          4.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :room_id => '2', :chat_type => types[i])
          end

        end

        Timecop.travel(Time.now - 20.day) do
          
          3.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :room_id => '3', :chat_type => types[i])
          end

        end
      }

      it '准备数据' do
        expect(ChatLine.all.length).to eq(10)
      end

      it 'by_room_id' do
        expect(ChatLine.by_room_id(1).length).to eq(3)
      end

      it 'by_month' do
        expect(ChatLine.by_month('2015-02-01', '2015-06-01').length).to eq(7)
      end

      it 'by_room_id && by_month' do
        expect(ChatLine.by_room_id(1).by_month('2015-02-01', '2015-06-01').length).to eq(3)
      end
    end
    
  end

  
  
end

