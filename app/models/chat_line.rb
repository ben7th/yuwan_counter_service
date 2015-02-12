class ChatLine

  include Mongoid::Document
  include Mongoid::Timestamps

  field :room_id,          type: Integer
  field :manager,          type: String
  field :text,             type: String
  field :username,         type: String
  field :userlevel,        type: String
  field :talk_time,        type: DateTime
  field :chat_type,        type: String

  index talk_time: 1
  index chat_type: 1
  validates :room_id, :presence => true


  scope :by_room_id, ->(room_id) { where(:room_id => room_id) }

  scope :by_month_scope, ->(start_month, end_month) { 
    where(:talk_time.gte => start_month, :talk_time.lt => end_month) 
  }
  scope :by_week_scope, ->(start_week, end_week) { 
    where(:talk_time.gte => start_week, :talk_time.lt => end_week) 
  }
  scope :by_day_scope, ->(start_day, end_day) { 
    where(:talk_time.gte => start_day, :talk_time.lt => end_day) 
  }
  scope :by_hour_scope, ->(start_hour, end_hour) { 
    where(:talk_time.gte => start_hour, :talk_time.lt => end_hour) 
  }
  scope :by_minute_scope, ->(start_minute, end_minute) { 
    where(:talk_time.gte => start_minute, :talk_time.lt => end_minute) 
  }

  def self.by_month(start_str, end_str)
    by_datetime('month', start_str, end_str)
  end

  def self.by_week(start_str, end_str)
    by_datetime('week', start_str, end_str)
  end


  def self.by_day(start_str, end_str)
    by_datetime('day', start_str, end_str)
  end


  def self.by_hour(start_str, end_str)
    by_datetime('hour', start_str, end_str)
  end

  def self.by_minute(start_str, end_str)
    by_datetime('minute', start_str, end_str)
  end


  def self.by_datetime(time_format, start_str, end_str)
    eval "
      keys = StrTimeUtil.#{time_format}_str_list(start_str, end_str)
      result_data = {}
      keys.each do |key|
        start_time = StrTimeUtil.start_#{time_format}_str_to_time(key)
        end_time = StrTimeUtil.end_#{time_format}_str_to_time(key)
        count = self.where(:talk_time.gte => start_time, :talk_time.lt => end_time).count
        result_data[key] = count
      end
      return result_data
    "
  end


  def self.username_yuwan_stat(time_str_type, start_time_str, end_time_str)
    keys = StrTimeUtil.send("#{time_str_type}_str_list", start_time_str, end_time_str)
    result_data = {}
    keys.each do |key|
      start_time = StrTimeUtil.send("start_#{time_str_type}_str_to_time", key)
      end_time = StrTimeUtil.send("end_#{time_str_type}_str_to_time", key)

      user_data = self.collection.aggregate(
          {
            "$match" => {
              talk_time: {
                "$gte" => start_time,
                "$lt" => end_time,
              },
              chat_type: {
                "$in" => ['yuwan']
              },
            },
          },  
          {
            "$group" => {
              _id: "$username", 
              count: { "$sum" => 100 }
            }
          },
          
      )

      result_data[key] = user_data
    end
    result_data


    # eval "
    #   keys = StrTimeUtil.#{time_str_type}_str_list(start_time_str, end_time_str)
    #   result_data = {}
    #   keys.each do |key|
    #     start_time = StrTimeUtil.start_#{time_str_type}_str_to_time(key)
    #     end_time = StrTimeUtil.end_#{time_str_type}_str_to_time(key)
    #     user_data = self.where(
    #       :talk_time.gte => start_time, 
    #       :talk_time.lt => end_time,
    #       :chat_type => 'yuwan').group_by{|d| d.username }


    #     user_data = user_data.each do |username, items|
    #       user_data[username] = items.count * 100
    #     end
    #     result_data[key] = user_data
    #   end
    #   return result_data
    # "
  end

end