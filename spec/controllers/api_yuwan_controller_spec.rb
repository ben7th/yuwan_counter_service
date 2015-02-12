require 'rails_helper'

describe ApiController do

  describe "统计鱼丸" do

    describe "by_month" do
      before {
        @start_month = '2014-02'
        @end_month = '2014-03'

        t = Time.local(2014, 2, 1, 0, 0, 0)
        Timecop.travel(t) do

          3.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :username => 'luffy1')
            FactoryGirl.create(:chat_line, :username => 'luffy1', :chat_type => 'yuwan')
          end

          2.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :username => 'luffy2', :chat_type => 'yuwan')
            FactoryGirl.create(:chat_line, :username => 'luffy2')
          end

        end


        t = Time.local(2014, 4, 1, 0, 0, 0)
        Timecop.travel(t - 1.day) do
          
          1.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :username => 'lucy', :chat_type => 'yuwan')
          end

        end


        @chat_lines = ChatLine.username_yuwan_stat('month', @start_month, @end_month)

        # p @chat_lines

      }


      it '总数量正确' do
        p @chat_lines
        expect(@chat_lines.length).to eq(2)
      end

      it '2014-02 luffy1' do
        expect(@chat_lines['2014-02']['luffy1']).to eq(300)
      end

      it '2014-02 luffy2' do
        expect(@chat_lines['2014-02']['luffy2']).to eq(200)
      end

      it '2014-03 lucy' do
        expect(@chat_lines['2014-03']['lucy']).to eq(100)
      end

    end





    describe "by_hour" do
      before {
        @start_hour = '2014-12-04 21:'
        @end_hour = '2015-01-16 08:'

        t = Time.local(2014, 12, 4, 21, 0, 0)
        Timecop.travel(t) do

          2.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :username => 'luffy1', :chat_type => 'yuwan')
          end

          2.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :username => 'luffy2', :chat_type => 'yuwan')
          end

        end


        t = Time.local(2015, 1, 16, 8, 0, 0)
        Timecop.travel(t) do
          
          10.times do |item|
            i = rand(4)
            FactoryGirl.create(:chat_line, :username => 'lucy', :chat_type => 'yuwan')
          end

        end

        @chat_lines = ChatLine.username_yuwan_stat('hour', @start_hour, @end_hour)

      }

      it '2014-12-04 21:' do
        expect(@chat_lines['2014-12-04 21:'].length).to eq(2)
      end


      it '2014-12-04 21: luffy1' do
        expect(@chat_lines['2014-12-04 21:']['luffy1']).to eq(200)
      end

      it '2014-12-04 21: luffy2' do
        expect(@chat_lines['2014-12-04 21:']['luffy2']).to eq(200)
      end

      it '2015-01-16 08:  lucy' do
        expect(@chat_lines['2015-01-16 08:']['lucy']).to eq(1000)
      end

    end


  end


end