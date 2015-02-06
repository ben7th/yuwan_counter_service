class StrTimeUtil
  class StringFormatError < StandardError;end

  # '2014-12'    => time(2014-12-01 00:00:00 +0800)
  def self.start_month_str_to_time(str)
    match_data = str.match(/^([0-9]{4})-(0[1-9]|1[0-2])$/)
    if match_data.blank?
      raise StringFormatError.new("时间字符串格式错误")
    end
    year  = match_data[1].to_i
    month = match_data[2].to_i
    begin
      time = Time.new(match_data[1], match_data[2])
    rescue
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.year != year
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.month != month
      raise StringFormatError.new("时间字符串格式错误")
    end
    time
  end

  # '2014-12'    => time(2015-01-01 00:00:00 +0800)
  def self.end_month_str_to_time(str)
    time = self.start_month_str_to_time(str)
    time + 1.month
  end

  # '2015-02-W1' => time(2015-02-02 00:00:00 +0800)
  def self.start_week_str_to_time(str)
    match_data = str.match(/^([0-9]{4})-(0[1-9]|1[0-2])-W([1-5])$/)
    if match_data.blank?
      raise StringFormatError.new("时间字符串格式错误")
    end

    year = match_data[1].to_i
    month = match_data[2].to_i
    week = match_data[3].to_i
    begin
      time = Time.new(year,month)
    rescue
      raise StringFormatError.new("时间字符串格式错误")
    end
    first_monday = time + ((time.wday-8).abs%7).day
    start_week_time = first_monday+(week-1)*7.day
    if start_week_time.month != month
      raise StringFormatError.new("时间字符串格式错误")
    end
    start_week_time
  end

  # '2015-02-W1' => time(2015-02-09 00:00:00 +0800)
  def self.end_week_str_to_time(str)
    time = self.start_week_str_to_time(str)
    time + 7.day
  end

  def self.start_day_str_to_time(str)
    match_data = str.match(/^([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])$/)
    if match_data.blank?
      raise StringFormatError.new("时间字符串格式错误")
    end
    year = match_data[1].to_i
    month = match_data[2].to_i
    day = match_data[3].to_i
    begin
      time = Time.new(year,month,day)
    rescue
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.year != year
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.month != month
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.day != day
      raise StringFormatError.new("时间字符串格式错误")
    end
    time
  end

  def self.end_day_str_to_time(str)
    time = self.start_day_str_to_time(str)
    time + 1.day
  end

  def self.start_hour_str_to_time(str)
    match_data = str.match(/^([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):$/)
    if match_data.blank?
      raise StringFormatError.new("时间字符串格式错误")
    end
    year  = match_data[1].to_i
    month = match_data[2].to_i
    day   = match_data[3].to_i
    hour  = match_data[4].to_i
    begin
      time = Time.new(year,month,day,hour)
    rescue
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.year != year
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.month != month
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.day != day
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.hour != hour
      raise StringFormatError.new("时间字符串格式错误")
    end
    time
  end

  def self.end_hour_str_to_time(str)
    time = self.start_hour_str_to_time(str)
    time+1.hour
  end

  def self.start_minute_str_to_time(str)
    match_data = str.match(/^([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]|)$/)
    if match_data.blank?
      raise StringFormatError.new("时间字符串格式错误")
    end
    year  = match_data[1].to_i
    month = match_data[2].to_i
    day   = match_data[3].to_i
    hour  = match_data[4].to_i
    minute = match_data[5].to_i
    begin
      time = Time.new(year,month,day,hour,minute)
    rescue
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.year != year
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.month != month
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.day != day
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.hour != hour
      raise StringFormatError.new("时间字符串格式错误")
    end
    if time.min != minute
      raise StringFormatError.new("时间字符串格式错误")
    end
    time
  end

  def self.end_minute_str_to_time(str)
    time = self.start_minute_str_to_time(str)
    time+1.minute
  end

  #### time to str ####

  # time(2015-02-05 15:50:42 +0800) => "2015-02"
  def self.time_to_month_str(time)
    time = time.getlocal("+08:00")
    time.strftime("%Y-%m")
  end

  # time(2015-02-05 15:50:42 +0800) => "2015-02-W1"
  def self.time_to_week_str(time)
    time = time.getlocal("+08:00")
    time = time.beginning_of_week
    "#{time.strftime("%Y-%m")}-W#{(time.day-1)/7+1}"
  end

  # time(2015-02-05 15:50:42 +0800) => "2015-02-05"
  def self.time_to_day_str(time)
    time = time.getlocal("+08:00")
    time.strftime("%Y-%m-%d")
  end

  # time(2015-02-05 15:50:42 +0800) => "2015-02-05 15:"
  def self.time_to_hour_str(time)
    time = time.getlocal("+08:00")
    time.strftime("%Y-%m-%d %H:")
  end

  # time(2015-02-05 15:50:42 +0800) => "2015-02-05 15:50"
  def self.time_to_minute_str(time)
    time = time.getlocal("+08:00")
    time.strftime("%Y-%m-%d %H:%M")
  end
end