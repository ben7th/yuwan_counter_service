require 'rails_helper'

RSpec.describe ChatLine, :type => :model do
  describe 'username_all_chat_stat' do
    it 'month' do
      # time_str_type = 'month'
      # start_time_str = '2012-09'
      # end_time_str = '2012-11'
      Timecop.travel(Time.local(2012, 8)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 8)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 9)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 9)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 11)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_all_chat_stat('month','2012-09','2012-11')

      expect(result).to eq({
        'user1' => 4,
        'user2' => 9,
        'user3' => 6,
      })
    end
    it 'week' do
      # time_str_type = 'week'
      # start_time_str = '2015-01-W1'
      # end_time_str = '2015-01-W3'
      Timecop.travel(Time.local(2015, 1, 3)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 3)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 17)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 24)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_all_chat_stat('week','2015-01-W1','2015-01-W3')

      expect(result).to eq({
        'user1' => 4,
        'user2' => 9,
        'user3' => 6,
      })
    end
    it 'day' do
      # time_str_type = 'day'
      # start_time_str = '2015-01-02'
      # end_time_str = '2015-01-04'
      Timecop.travel(Time.local(2015, 1, 1)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 1)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 3)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 4)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_all_chat_stat('day','2015-01-02','2015-01-04')

      expect(result).to eq({
        'user1' => 4,
        'user2' => 9,
        'user3' => 6,
      })
    end
    it 'hour' do
      # time_str_type = 'hour'
      # start_time_str = '2015-01-02 06:'
      # end_time_str = '2015-01-02 08:'
      Timecop.travel(Time.local(2015, 1, 2, 5)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 5)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 7)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 8)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_all_chat_stat('hour','2015-01-02 06:','2015-01-02 08:')

      expect(result).to eq({
        'user1' => 4,
        'user2' => 9,
        'user3' => 6,
      })
    end
    it 'minute' do
      # time_str_type = 'minute'
      # start_time_str = '2015-01-02 06:11'
      # end_time_str = '2015-01-02 06:13'
      Timecop.travel(Time.local(2015, 1, 2, 6, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 11)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 11)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 12)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 13)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_all_chat_stat('minute','2015-01-02 06:11','2015-01-02 06:13')

      expect(result).to eq({
        'user1' => 4,
        'user2' => 9,
        'user3' => 6,
      })
    end
  end

  describe 'username_section_chat_stat' do
    it 'month' do
      # time_str_type = 'month'
      # start_time_str = '2012-09'
      # end_time_str = '2012-11'
      Timecop.travel(Time.local(2012, 8)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 8)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 9)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 9)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2012, 11)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_section_chat_stat('month','2012-09','2012-11')

      expect(result).to eq({
        '2012-09' => {
          'user1' => 2,
          'user2' => 3,
          'user3' => 2
        },
        '2012-10' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
        '2012-11' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
      })
    end
    it 'week' do
      # time_str_type = 'week'
      # start_time_str = '2015-01-W1'
      # end_time_str = '2015-01-W3'
      Timecop.travel(Time.local(2015, 1, 3)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 3)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 17)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 24)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_section_chat_stat('week','2015-01-W1','2015-01-W3')

      expect(result).to eq({
        '2015-01-W1' => {
          'user1' => 2,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-W2' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-W3' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
      })
    end
    it 'day' do
      # time_str_type = 'day'
      # start_time_str = '2015-01-02'
      # end_time_str = '2015-01-04'
      Timecop.travel(Time.local(2015, 1, 1)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 1)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 3)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 4)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_section_chat_stat('day','2015-01-02','2015-01-04')

      expect(result).to eq({
        '2015-01-02' => {
          'user1' => 2,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-03' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-04' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
      })
    end
    it 'hour' do
      # time_str_type = 'hour'
      # start_time_str = '2015-01-02 06:'
      # end_time_str = '2015-01-02 08:'
      Timecop.travel(Time.local(2015, 1, 2, 5)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 5)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 7)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 8)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_section_chat_stat('hour','2015-01-02 06:','2015-01-02 08:')

      expect(result).to eq({
        '2015-01-02 06:' => {
          'user1' => 2,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-02 07:' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-02 08:' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
      })
    end
    it 'minute' do
      # time_str_type = 'minute'
      # start_time_str = '2015-01-02 06:11'
      # end_time_str = '2015-01-02 06:13'
      Timecop.travel(Time.local(2015, 1, 2, 6, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 9, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 10)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 11)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::WELCOME)
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 11)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 12)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      Timecop.travel(Time.local(2015, 1, 2, 6, 13)) do
        FactoryGirl.create(:chat_line, :username => 'user1', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user2', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
        FactoryGirl.create(:chat_line, :username => 'user3', :room_id => 10, :chat_type => ChatLine::ChatType::CHAT)
      end

      result = ChatLine.by_room_id(10).
        username_section_chat_stat('minute','2015-01-02 06:11','2015-01-02 06:13')

      expect(result).to eq({
        '2015-01-02 06:11' => {
          'user1' => 2,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-02 06:12' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
        '2015-01-02 06:13' => {
          'user1' => 1,
          'user2' => 3,
          'user3' => 2
        },
      })
    end
  end
end
