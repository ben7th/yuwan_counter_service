require 'rails_helper'

RSpec.describe RoomStatus, :type => :model do
  describe 'stat' do
    it 'month' do
      # time_str_type = 'month'
      # start_time_str = '2012-09'
      # end_time_str = '2012-11'
      Timecop.travel(Time.local(2012, 8, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 11, :online_number => 11, :yuwan_count => "1111")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 21, :online_number => 21, :yuwan_count => "2111")
      end
      Timecop.travel(Time.local(2012, 8, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 12, :online_number => 122, :yuwan_count => "1222")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 22, :online_number => 222, :yuwan_count => "2222")
      end

      Timecop.travel(Time.local(2012, 9, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 13, :online_number => 133, :yuwan_count => "1333")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 23, :online_number => 233, :yuwan_count => "2333")
      end
      Timecop.travel(Time.local(2012, 9, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 14, :online_number => 144, :yuwan_count => "1444")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 24, :online_number => 244, :yuwan_count => "2444")
      end

      Timecop.travel(Time.local(2012, 10, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 15, :online_number => 155, :yuwan_count => "1555")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 25, :online_number => 255, :yuwan_count => "2555")
      end
      Timecop.travel(Time.local(2012, 10, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 16, :online_number => 166, :yuwan_count => "1666")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 26, :online_number => 266, :yuwan_count => "2666")
      end

      Timecop.travel(Time.local(2012, 11, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 17, :online_number => 177, :yuwan_count => "1777")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 27, :online_number => 277, :yuwan_count => "2777")
      end
      Timecop.travel(Time.local(2012, 11, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 18, :online_number => 188, :yuwan_count => "1888")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 28, :online_number => 288, :yuwan_count => "2888")
      end

      result = RoomStatus.stat(2, 'month', '2012-09', '2012-11')
      expect(result).to eq({
        "2012-09"=> {
          "follow_count"=>23, 
          "online_number"=>233, 
          "yuwan_count"=>"2333"
        }, 
        "2012-10"=> {
          "follow_count"=>25,
          "online_number"=>255,
          "yuwan_count"=>"2555"
        },
        "2012-11"=> {
          "follow_count"=>27,
          "online_number"=>277,
          "yuwan_count"=>"2777"
        }
      })
    end

    it 'week' do

    end

    it 'day' do
    end

    it 'hour' do
    end

    it 'minute' do
    end
  end
end