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


  def self.method_missing(method, *args)
    start_str = args[0]
    end_str = args[1]
    time_format = method.to_s[3..-1]

    eval "
      start_time = StrTimeUtil.start_#{time_format}_str_to_time(start_str)
      end_time = StrTimeUtil.end_#{time_format}_str_to_time(end_str)
      keys = StrTimeUtil.#{time_format}_str_list(start_str, end_str)


      chat_lines = self.where(:talk_time.gte => start_time, :talk_time.lt => end_time)

      list_data = Hash.new
      keys.each do |key|
        list_data[key] = 0
        chat_lines.each do |item|
          time = StrTimeUtil.time_to_#{time_format}_str(item.talk_time)
          list_data[key] += 1 if time == key
        end
      end


      return list_data
    "
  end




end