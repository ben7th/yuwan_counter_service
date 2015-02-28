require 'rails_helper'

describe ApiController do

  before {
    @room_id = 1
  }

  describe "统计用户聊天数" do



    describe "by_month" do
      before {
        @start_month = '2014-02'
        @end_month = '2014-03'
        

        t = Time.local(2014, 2, 1, 0, 0, 0)
        Timecop.travel(t) do

          3.times do |item|
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy1', :chat_type => 'forbid')
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy1', :chat_type => 'chat')
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => '张三', :chat_type => 'chat')
          end

          2.times do |item|
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy2', :chat_type => 'chat')
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy2', :chat_type => 'forbid')
          end

          5.times do |item|
            FactoryGirl.create(:chat_line, :room_id => 10, :username => 'luffy2', :chat_type => 'chat')
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy2', :chat_type => 'forbid')
          end



        end


        t = Time.local(2014, 4, 1, 0, 0, 0)
        Timecop.travel(t - 1.day) do
          
          1.times do |item|
            FactoryGirl.create(:chat_line, :room_id => @room_id, :manager => 'lucy', :chat_type => 'chat')
          end

        end

        @chat_lines_0 = ChatLine.query_by_username('张三', @room_id, 'month', @start_month, @end_month)
        @chat_lines_1 = ChatLine.query_by_username('luffy1', @room_id, 'month', @start_month, @end_month)
        @chat_lines_2 = ChatLine.query_by_username('luffy2', @room_id, 'month', @start_month, @end_month)
        @chat_lines_3 = ChatLine.query_by_username('lucy', @room_id, 'month', @start_month, @end_month)
      }


      it '2014-02 张三' do
        expect(@chat_lines_0['2014-02']).to eq(3)
      end

      it '2014-02 luffy1' do
        expect(@chat_lines_1['2014-02']).to eq(3)
      end

      it '2014-02 luffy2' do
        expect(@chat_lines_2['2014-02']).to eq(2)
      end

      it '2014-03 lucy' do
        expect(@chat_lines_3['2014-03']).to eq(0)
      end

    end





    describe "by_hour" do
      before {
        @start_hour = '2014-12-04 21:'
        @end_hour = '2015-01-16 08:'

        t = Time.local(2014, 12, 4, 21, 0, 0)
        Timecop.travel(t) do

          2.times do |item|
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy1', :chat_type => 'chat')
          end

          2.times do |item|
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy2', :chat_type => 'chat')
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'luffy2', :chat_type => 'forbid')
          end

        end


        t = Time.local(2015, 1, 16, 8, 0, 0)
        Timecop.travel(t) do
          
          10.times do |item|
            FactoryGirl.create(:chat_line, :room_id => @room_id, :username => 'lucy', :chat_type => 'chat')
            FactoryGirl.create(:chat_line, :username => 'lucy', :chat_type => 'chat', :chat_type => 'forbid')
          end

        end

        @chat_lines_1 = ChatLine.query_by_username('luffy1', @room_id, 'hour', @start_hour, @end_hour)
        @chat_lines_2 = ChatLine.query_by_username('luffy2', @room_id, 'hour', @start_hour, @end_hour)
        @chat_lines_3 = ChatLine.query_by_username('lucy', @room_id, 'hour', @start_hour, @end_hour)

      }


      it '2014-12-04 21: luffy1' do
        expect(@chat_lines_1['2014-12-04 21:']).to eq(2)
      end

      it '2014-12-04 21: luffy2' do
        expect(@chat_lines_2['2014-12-04 21:']).to eq(2)
      end

      it '2015-01-16 08:  lucy' do
        expect(@chat_lines_3['2015-01-16 08:']).to eq(10)
      end

    end


  end


end