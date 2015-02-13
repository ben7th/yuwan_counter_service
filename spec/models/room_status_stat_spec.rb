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
      # time_str_type = 'week'
      # start_time_str = '2015-01-W1'
      # end_time_str = '2015-01-W3'
      Timecop.travel(Time.local(2015, 1, 3, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 11, :online_number => 11, :yuwan_count => "1111")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 21, :online_number => 21, :yuwan_count => "2111")
      end
      Timecop.travel(Time.local(2015, 1, 3, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 12, :online_number => 122, :yuwan_count => "1222")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 22, :online_number => 222, :yuwan_count => "2222")
      end

      Timecop.travel(Time.local(2015, 1, 10, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 13, :online_number => 133, :yuwan_count => "1333")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 23, :online_number => 233, :yuwan_count => "2333")
      end
      Timecop.travel(Time.local(2015, 1, 10, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 14, :online_number => 144, :yuwan_count => "1444")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 24, :online_number => 244, :yuwan_count => "2444")
      end

      Timecop.travel(Time.local(2015, 1, 17, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 15, :online_number => 155, :yuwan_count => "1555")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 25, :online_number => 255, :yuwan_count => "2555")
      end
      Timecop.travel(Time.local(2015, 1, 17, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 16, :online_number => 166, :yuwan_count => "1666")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 26, :online_number => 266, :yuwan_count => "2666")
      end

      Timecop.travel(Time.local(2015, 1, 24, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 17, :online_number => 177, :yuwan_count => "1777")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 27, :online_number => 277, :yuwan_count => "2777")
      end
      Timecop.travel(Time.local(2015, 1, 24, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 18, :online_number => 188, :yuwan_count => "1888")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 28, :online_number => 288, :yuwan_count => "2888")
      end

      result = RoomStatus.stat(2, 'week', '2015-01-W1', '2015-01-W3')
      expect(result).to eq({
        "2015-01-W1"=> {
          "follow_count"=>23, 
          "online_number"=>233, 
          "yuwan_count"=>"2333"
        }, 
        "2015-01-W2"=> {
          "follow_count"=>25,
          "online_number"=>255,
          "yuwan_count"=>"2555"
        },
        "2015-01-W3"=> {
          "follow_count"=>27,
          "online_number"=>277,
          "yuwan_count"=>"2777"
        }
      })
    end

    it 'day' do
      # time_str_type = 'day'
      # start_time_str = '2015-01-02'
      # end_time_str = '2015-01-04'
      Timecop.travel(Time.local(2015, 1, 1, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 11, :online_number => 11, :yuwan_count => "1111")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 21, :online_number => 21, :yuwan_count => "2111")
      end
      Timecop.travel(Time.local(2015, 1, 1, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 12, :online_number => 122, :yuwan_count => "1222")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 22, :online_number => 222, :yuwan_count => "2222")
      end

      Timecop.travel(Time.local(2015, 1, 2, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 13, :online_number => 133, :yuwan_count => "1333")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 23, :online_number => 233, :yuwan_count => "2333")
      end
      Timecop.travel(Time.local(2015, 1, 2, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 14, :online_number => 144, :yuwan_count => "1444")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 24, :online_number => 244, :yuwan_count => "2444")
      end

      Timecop.travel(Time.local(2015, 1, 3, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 15, :online_number => 155, :yuwan_count => "1555")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 25, :online_number => 255, :yuwan_count => "2555")
      end
      Timecop.travel(Time.local(2015, 1, 3, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 16, :online_number => 166, :yuwan_count => "1666")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 26, :online_number => 266, :yuwan_count => "2666")
      end

      Timecop.travel(Time.local(2015, 1, 4, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 17, :online_number => 177, :yuwan_count => "1777")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 27, :online_number => 277, :yuwan_count => "2777")
      end
      Timecop.travel(Time.local(2015, 1, 4, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 18, :online_number => 188, :yuwan_count => "1888")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 28, :online_number => 288, :yuwan_count => "2888")
      end

      result = RoomStatus.stat(2, 'day', '2015-01-02', '2015-01-04')
      expect(result).to eq({
        "2015-01-02"=> {
          "follow_count"=>23, 
          "online_number"=>233, 
          "yuwan_count"=>"2333"
        }, 
        "2015-01-03"=> {
          "follow_count"=>25,
          "online_number"=>255,
          "yuwan_count"=>"2555"
        },
        "2015-01-04"=> {
          "follow_count"=>27,
          "online_number"=>277,
          "yuwan_count"=>"2777"
        }
      })
    end

    it 'hour' do
      # time_str_type = 'hour'
      # start_time_str = '2015-01-02 06:'
      # end_time_str = '2015-01-02 08:'
      Timecop.travel(Time.local(2015, 1, 2, 5, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 11, :online_number => 11, :yuwan_count => "1111")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 21, :online_number => 21, :yuwan_count => "2111")
      end
      Timecop.travel(Time.local(2015, 1, 2, 5, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 12, :online_number => 122, :yuwan_count => "1222")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 22, :online_number => 222, :yuwan_count => "2222")
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 13, :online_number => 133, :yuwan_count => "1333")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 23, :online_number => 233, :yuwan_count => "2333")
      end
      Timecop.travel(Time.local(2015, 1, 2, 6, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 14, :online_number => 144, :yuwan_count => "1444")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 24, :online_number => 244, :yuwan_count => "2444")
      end

      Timecop.travel(Time.local(2015, 1, 2, 7, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 15, :online_number => 155, :yuwan_count => "1555")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 25, :online_number => 255, :yuwan_count => "2555")
      end
      Timecop.travel(Time.local(2015, 1, 2, 7, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 16, :online_number => 166, :yuwan_count => "1666")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 26, :online_number => 266, :yuwan_count => "2666")
      end

      Timecop.travel(Time.local(2015, 1, 2, 8, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 17, :online_number => 177, :yuwan_count => "1777")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 27, :online_number => 277, :yuwan_count => "2777")
      end
      Timecop.travel(Time.local(2015, 1, 2, 8, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 18, :online_number => 188, :yuwan_count => "1888")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 28, :online_number => 288, :yuwan_count => "2888")
      end

      result = RoomStatus.stat(2, 'hour', '2015-01-02 06:', '2015-01-02 08:')
      expect(result).to eq({
        "2015-01-02 06:"=> {
          "follow_count"=>23, 
          "online_number"=>233, 
          "yuwan_count"=>"2333"
        }, 
        "2015-01-02 07:"=> {
          "follow_count"=>25,
          "online_number"=>255,
          "yuwan_count"=>"2555"
        },
        "2015-01-02 08:"=> {
          "follow_count"=>27,
          "online_number"=>277,
          "yuwan_count"=>"2777"
        }
      })
    end

    it 'minute' do
      # time_str_type = 'minute'
      # start_time_str = '2015-01-02 06:11'
      # end_time_str = '2015-01-02 06:13'
      Timecop.travel(Time.local(2015, 1, 2, 6, 10, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 11, :online_number => 11, :yuwan_count => "1111")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 21, :online_number => 21, :yuwan_count => "2111")
      end
      Timecop.travel(Time.local(2015, 1, 2, 6, 10, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 12, :online_number => 122, :yuwan_count => "1222")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 22, :online_number => 222, :yuwan_count => "2222")
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 11, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 13, :online_number => 133, :yuwan_count => "1333")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 23, :online_number => 233, :yuwan_count => "2333")
      end
      Timecop.travel(Time.local(2015, 1, 2, 6, 11, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 14, :online_number => 144, :yuwan_count => "1444")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 24, :online_number => 244, :yuwan_count => "2444")
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 12, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 15, :online_number => 155, :yuwan_count => "1555")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 25, :online_number => 255, :yuwan_count => "2555")
      end
      Timecop.travel(Time.local(2015, 1, 2, 6, 12, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 16, :online_number => 166, :yuwan_count => "1666")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 26, :online_number => 266, :yuwan_count => "2666")
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 13, 1)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 17, :online_number => 177, :yuwan_count => "1777")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 27, :online_number => 277, :yuwan_count => "2777")
      end
      Timecop.travel(Time.local(2015, 1, 2, 6, 13, 2)) do
        FactoryGirl.create(:room_status, :room_id => 1, :follow_count => 18, :online_number => 188, :yuwan_count => "1888")
        FactoryGirl.create(:room_status, :room_id => 2, :follow_count => 28, :online_number => 288, :yuwan_count => "2888")
      end

      result = RoomStatus.stat(2, 'minute', '2015-01-02 06:11', '2015-01-02 06:13')
      expect(result).to eq({
        "2015-01-02 06:11"=> {
          "follow_count"=>23, 
          "online_number"=>233, 
          "yuwan_count"=>"2333"
        }, 
        "2015-01-02 06:12"=> {
          "follow_count"=>25,
          "online_number"=>255,
          "yuwan_count"=>"2555"
        },
        "2015-01-02 06:13"=> {
          "follow_count"=>27,
          "online_number"=>277,
          "yuwan_count"=>"2777"
        }
      })

    end


  end
end