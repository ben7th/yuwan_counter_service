RSpec.describe StrTimeUtil do
  describe 'str_to_time' do
    describe 'month_str' do
      it 'start_month_str_to_time' do
        # '2014-12'    => time(2014-12-01 00:00:00 +0800)
        str = '2014-12'
        time = StrTimeUtil.start_month_str_to_time(str)
        expect(time).to eq(Time.new(2014, 12))

        str = '2014-13'
        expect { 
          StrTimeUtil.start_month_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end

      it "end_month_str_to_time" do
        # '2014-12'    => time(2015-01-01 00:00:00 +0800)
        str = '2014-12'
        time = StrTimeUtil.end_month_str_to_time(str)
        expect(time).to eq(Time.new(2015, 1))

        str = '2014-13'
        expect { 
          StrTimeUtil.end_month_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end
    end

    describe 'week_str' do
      it 'start_week_str_to_time' do
        # '2015-02-W1' => time(2015-02-02 00:00:00 +0800)
        str = '2015-02-W1'
        time = StrTimeUtil.start_week_str_to_time(str)
        expect(time).to eq(Time.new(2015, 2,2))

        str = '2015-13-W1'
        expect { 
          StrTimeUtil.start_week_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-02-A1'
        expect { 
          StrTimeUtil.start_week_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-02-W5'
        expect { 
          StrTimeUtil.start_week_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end

      it 'end_week_str_to_time' do
        # '2015-02-W1' => time(2015-02-09 00:00:00 +0800)
        str = '2015-02-W1'
        time = StrTimeUtil.end_week_str_to_time(str)
        expect(time).to eq(Time.new(2015, 2,9))

        str = '2015-13-W1'
        expect { 
          StrTimeUtil.start_week_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-02-A1'
        expect { 
          StrTimeUtil.start_week_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-02-W5'
        expect { 
          StrTimeUtil.start_week_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end
    end

    describe 'day_str' do
      it 'start_day_str_to_time' do
        # '2015-02-05' => time(2015-02-05 00:00:00 +0800)
        str = '2015-02-05'
        time = StrTimeUtil.start_day_str_to_time(str)
        expect(time).to eq(Time.new(2015,2,5))

        str = '2015-02-30'
        expect { 
          StrTimeUtil.start_day_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-03-32'
        expect { 
          StrTimeUtil.start_day_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end

      it 'end_day_str_to_time' do
        # '2015-02-05' => time(2015-02-06 00:00:00 +0800)
        str = '2015-02-05'
        time = StrTimeUtil.end_day_str_to_time(str)
        expect(time).to eq(Time.new(2015,2,6))

        str = '2015-02-30'
        expect { 
          StrTimeUtil.end_day_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-03-32'
        expect { 
          StrTimeUtil.end_day_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end
    end
    
    describe 'hour_str' do
      it 'start_hour_str_to_time' do
        # '2015-02-05 15:' => time(2015-02-05 15:00:00 +0800)
        str = '2015-02-05 15:'
        time = StrTimeUtil.start_hour_str_to_time(str)
        expect(time).to eq(Time.new(2015,2,5,15))

        str = '2015-02-05 19'
        expect { 
          StrTimeUtil.start_hour_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-02-05 26:'
        expect { 
          StrTimeUtil.start_hour_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end

      it 'end_hour_str_to_time' do
        # '2015-02-05 15:' => time(2015-02-05 16:00:00 +0800)
        str = '2015-02-05 15:'
        time = StrTimeUtil.end_hour_str_to_time(str)
        expect(time).to eq(Time.new(2015,2,5,16))


        str = '2015-02-05 19'
        expect { 
          StrTimeUtil.end_hour_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError

        str = '2015-02-05 26:'
        expect { 
          StrTimeUtil.end_hour_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end
    end

    describe 'minute_str' do
      it 'start_minute_str_to_time' do
        # '2015-02-05 15:01' => time(2015-02-05 15:01:00 +0800)
        str = '2015-02-05 15:01'
        time = StrTimeUtil.start_minute_str_to_time(str)
        expect(time).to eq(Time.new(2015,2,5,15,1))

        str = '2015-02-05 15:61'
        expect {
          StrTimeUtil.start_minute_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
        str = '2015-02-05 15:70'
        expect {
          StrTimeUtil.start_minute_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end

      it 'end_minute_str_to_time' do
        # '2015-02-05 15:01' => time(2015-02-05 15:02:00 +0800)
        str = '2015-02-05 15:01'
        time = StrTimeUtil.end_minute_str_to_time(str)
        expect(time).to eq(Time.new(2015,2,5,15,2))

        str = '2015-02-05 15:61'
        expect {
          StrTimeUtil.end_minute_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
        str = '2015-02-05 15:70'
        expect {
          StrTimeUtil.end_minute_str_to_time(str)
        }.to raise_error StrTimeUtil::StringFormatError
      end
    end
  end

  describe 'time_to_str' do
    it 'time_to_month_str' do
      # time(2015-02-05 15:50:42 +0800) => "2015-02"
      time = Time.new(2015,2,5,15,50,42)
      str = StrTimeUtil.time_to_month_str(time)
      expect(str).to eq('2015-02')
    end

    it 'time_to_week_str' do
      # time(2015-02-05 15:50:42 +0800) => "2015-02-W1"
      time = Time.new(2015,2,5,15,50,42)
      str = StrTimeUtil.time_to_week_str(time)
      expect(str).to eq('2015-02-W1')

      time = Time.new(2015,2,16,15,50,42)
      str = StrTimeUtil.time_to_week_str(time)
      expect(str).to eq('2015-02-W3')
    end

    it 'time_to_day_str' do
      # time(2015-02-05 15:50:42 +0800) => "2015-02-05"
      time = Time.new(2015,2,5,15,50,42)
      str = StrTimeUtil.time_to_day_str(time)
      expect(str).to eq('2015-02-05')
    end

    it 'time_to_hour_str' do
      # time(2015-02-05 15:50:42 +0800) => "2015-02-05 15:"
      time = Time.new(2015,2,5,15,50,42)
      str = StrTimeUtil.time_to_hour_str(time)
      expect(str).to eq('2015-02-05 15:')
    end

    it 'time_to_minute_str' do
      # time(2015-02-05 15:50:42 +0800) => "2015-02-05 15:50"
      time = Time.new(2015,2,5,15,50,42)
      str = StrTimeUtil.time_to_minute_str(time)
      expect(str).to eq('2015-02-05 15:50')
    end
  end
end