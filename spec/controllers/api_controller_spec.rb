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
    before {
      @types = ['chat', 'welcome', 'forbid', 'yuwan']
    }


    describe "by_room_id && by_month" do
      before {
        @start_month = '2014-02'
        @end_month = '2014-03'

        t = Time.local(2014, 2, 1, 0, 0, 0)
        Timecop.travel(t) do

          3.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :room_id => 10, :chat_type => @types[i])
          end

        end


        @chat_lines = ChatLine.by_month(@start_month, @end_month)
      }


      it 'room_id && month' do
        expect(ChatLine.by_room_id(10).by_month(@start_month, @end_month)['2014-02']).to eq(3)
      end
    end

    describe "by_month" do
      before {
        @start_month = '2014-02'
        @end_month = '2014-03'

        t = Time.local(2014, 2, 1, 0, 0, 0)
        Timecop.travel(t) do

          3.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        t = Time.local(2014, 4, 1, 0, 0, 0)
        Timecop.travel(t - 1.day) do
          
          1.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        @chat_lines = ChatLine.by_month(@start_month, @end_month)

      }


      it '总数量正确' do
        expect(@chat_lines.length).to eq(2)
      end

      it '2014-02' do
        expect(@chat_lines['2014-02']).to eq(3)
      end

      it '2014-03' do
        expect(@chat_lines['2014-03']).to eq(1)
      end

    end


    describe "by_week" do
      before {
        @start_week = '2014-12-W1'
        @end_week = '2015-01-W4'

        t = Time.local(2014, 12, 1, 0, 0, 0)
        Timecop.travel(t) do

          2.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        t = Time.local(2015, 2, 1, 0, 0, 0)
        Timecop.travel(t - 1.day) do
          
          2.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        @chat_lines = ChatLine.by_week(@start_week, @end_week)

      }


      it '总数量正确' do
        # p @chat_lines
        expect(@chat_lines.length).to eq(9)
      end

      it '2014-12-W1' do
        expect(@chat_lines['2014-12-W1']).to eq(2)
      end

      it '2015-01-W4' do
        expect(@chat_lines['2015-01-W4']).to eq(2)
      end

    end




    describe "by_day" do
      before {
        @start_day = '2014-12-04'
        @end_day = '2015-01-31'

        t = Time.local(2014, 12, 4, 0, 0, 0)
        Timecop.travel(t) do

          8.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        t = Time.local(2015, 2, 1, 0, 0, 0)
        Timecop.travel(t - 1.day) do
          
          2.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end

        @chat_lines = ChatLine.by_day(@start_day, @end_day)

      }


      it '总数量正确' do
        # p @chat_lines
        expect(@chat_lines.length).to eq(59)
      end

      it '2014-12-04' do
        expect(@chat_lines['2014-12-04']).to eq(8)
      end

      it '2015-01-31' do
        expect(@chat_lines['2015-01-31']).to eq(2)
      end

    end





    describe "by_hour" do
      before {
        @start_hour = '2014-12-04 21:'
        @end_hour = '2015-01-16 08:'

        t = Time.local(2014, 12, 4, 21, 0, 0)
        Timecop.travel(t) do

          1.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        t = Time.local(2015, 1, 16, 8, 0, 0)
        Timecop.travel(t) do
          
          1.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end

        @chat_lines = ChatLine.by_hour(@start_hour, @end_hour)

      }


      it '2014-12-04 21:' do
        expect(@chat_lines['2014-12-04 21:']).to eq(1)
      end

      it '2015-01-16 08:' do
        expect(@chat_lines['2015-01-16 08:']).to eq(1)
      end

    end



    describe "by_minute" do
      before {
        @start_minute = '2015-01-16 07:03'
        @end_minute = '2015-01-16 08:27'

        t = Time.local(2015, 01, 16, 07, 3, 0)
        Timecop.travel(t) do

          5.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        t = Time.local(2015, 1, 16, 8, 27, 0)
        Timecop.travel(t) do
          
          2.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :chat_type => @types[i])
          end

        end


        @chat_lines = ChatLine.by_minute(@start_minute, @end_minute)

      }


      it '2014-01-15 21:03' do
        expect(@chat_lines['2015-01-16 07:03']).to eq(5)
      end

      it '2015-01-16 08:27' do
        expect(@chat_lines['2015-01-16 08:27']).to eq(2)
      end

    end





    
  end

  
  
end

