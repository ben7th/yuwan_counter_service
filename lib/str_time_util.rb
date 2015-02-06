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
      time = Time.new(match_data[1], match_data[2],1,0,0,0,'+08:00')
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
      time = Time.new(year,month,1,0,0,0,"+08:00")
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

  # '2015-02-05' => time(2015-02-05 00:00:00 +0800)
  def self.start_day_str_to_time(str)
    match_data = str.match(/^([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-9]|3[0-1])$/)
    if match_data.blank?
      raise StringFormatError.new("时间字符串格式错误")
    end
    year = match_data[1].to_i
    month = match_data[2].to_i
    day = match_data[3].to_i
    begin
      time = Time.new(year,month,day,0,0,0,"+08:00")
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

  # '2015-02-05' => time(2015-02-06 00:00:00 +0800)
  def self.end_day_str_to_time(str)
    time = self.start_day_str_to_time(str)
    time + 1.day
  end

  # '2015-02-05 15:' => time(2015-02-05 15:00:00 +0800)
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
      time = Time.new(year,month,day,hour,0,0,"+08:00")
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

  # '2015-02-05 15:' => time(2015-02-05 16:00:00 +0800)
  def self.end_hour_str_to_time(str)
    time = self.start_hour_str_to_time(str)
    time+1.hour
  end

  # '2015-02-05 15:01' => time(2015-02-05 15:01:00 +0800)
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
      time = Time.new(year,month,day,hour,minute,0,"+08:00")
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

  # '2015-02-05 15:01' => time(2015-02-05 15:02:00 +0800)
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

  #### str_list ###

  # start_str => "2014-02"
  # end_str => "2014-05"
  # 返回值  => ["2014-02","2014-03","2014-04","2014-05"]
  def self.month_str_list(start_str, end_str)
    start_time = StrTimeUtil.start_month_str_to_time(start_str)
    end_time   = StrTimeUtil.end_month_str_to_time(end_str)

    time = start_time
    list = []
    while time < end_time
      list.push StrTimeUtil.time_to_month_str(time)
      time += 1.month
    end
    list
  end

  # start_str = "2014-02-W1"
  # end_str = "2014-02-W3"
  # 返回值  => ["2014-02-W1","2014-02-W2","2014-02-W3"]
  def self.week_str_list(start_str, end_str)
    start_time = StrTimeUtil.start_week_str_to_time(start_str)
    end_time   = StrTimeUtil.end_week_str_to_time(end_str)

    time = start_time
    list = []
    while time < end_time
      list.push StrTimeUtil.time_to_week_str(time)
      time += 7.day
    end
    list
  end

  # start_str = "2014-02-01"
  # end_str   = "2014-02-03"
  # 返回值  => ["2014-02-01","2014-02-02","2014-02-03"]
  def self.day_str_list(start_str, end_str)
    start_time = StrTimeUtil.start_day_str_to_time(start_str)
    end_time   = StrTimeUtil.end_day_str_to_time(end_str)

    time = start_time
    list = []
    while time < end_time
      list.push StrTimeUtil.time_to_day_str(time)
      time += 1.day
    end
    list
  end

  # start_str = "2014-02-01 01:"
  # end_str   = "2014-02-01 03:"
  # 返回值  => ["2014-02-01 01:","2014-02-01 02:","2014-02-01 03:"]
  def self.hour_str_list(start_str, end_str)
    start_time = StrTimeUtil.start_hour_str_to_time(start_str)
    end_time   = StrTimeUtil.end_hour_str_to_time(end_str)

    time = start_time
    list = []
    while time < end_time
      list.push StrTimeUtil.time_to_hour_str(time)
      time += 1.hour
    end
    list
  end

  # start_str = "2014-02-01 01:01"
  # end_str   = "2014-02-01 01:03"
  # 返回值  => ["2014-02-01 01:01","2014-02-01 01:02","2014-02-01 01:03"]
  def self.minute_str_list(start_str, end_str)
    start_time = StrTimeUtil.start_minute_str_to_time(start_str)
    end_time   = StrTimeUtil.end_minute_str_to_time(end_str)

    time = start_time
    list = []
    while time < end_time
      list.push StrTimeUtil.time_to_minute_str(time)
      time += 1.minute
    end
    list
  end
end