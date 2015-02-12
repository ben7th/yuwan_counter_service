class ChatLine
  class ChatType
    CHAT    = 'chat'
    WELCOME = 'welcome'
    FORBID  = 'forbid'
    YUWAN   = 'yuwan'
  end

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
  index room_id: 1
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

  # time_str_type =  'month' |  'week' | 'day' | 'hour' | 'minute'
  # start_time_str 和 end_time_str 格式根据 time_str_type 决定
  #   result 格式
  #   {
  #     # key 是 username
  #     # value 是 user 的 chat 类型的ChatLine 记录数
  #     "张三" => 3,
  #     "李四" => 2,
  #     "王五" => 5,
  #     "赵六" => 6,
  #     "赵七" => 7,
  #     "赵八" => 8,
  #     "赵九" => 9,
  #     "赵二" => 2,
  #     "赵一" => 1,
  #     "赵拾" => 10
  # }
  # 详细说明请看 https://github.com/ben7th/yuwan_counter_service/issues/3
  def self.username_all_chat_stat(time_str_type, start_time_str, end_time_str)
    # 时间内的所有人
    start_time = StrTimeUtil.send("start_#{time_str_type}_str_to_time", start_time_str)
    end_time =   StrTimeUtil.send("end_#{time_str_type}_str_to_time", end_time_str)
    data = self.collection.aggregate(
      {
        "$match" => {
          talk_time: {
            "$gte" => start_time,
            "$lt"  => end_time
          },
          chat_type: ChatLine::ChatType::CHAT
        } 
      },
      { 
        "$group" => {
          _id: "$username",
          count: { "$sum" => 1 }
        }
      },
      { 
        "$sort" => { count: -1 }  
      },
      { 
        "$limit" => 10
      }
    )

    result = {}
    data.each do |item|
      result[item["_id"]] = item["count"]
    end
    result
  end

  # time_str_type =  'month' |  'week' | 'day' | 'hour' | 'minute'
  # start_time_str 和 end_time_str 格式根据 time_str_type 决定
  #   result 格式举例
  #   {
  #     '2015-02-01' => {
  #       # key 是 username
  #       # value 是 user 的 chat 类型的ChatLine 记录数
  #       "张三" => 3,
  #       "李四" => 2,
  #       "王五" => 5,
  #       "赵六" => 6,
  #       "张三" => 3,
  #       "李四" => 2,
  #       "王五" => 5,
  #       "赵六" => 6,
  #       "赵七" => 7,
  #       "赵八" => 8,
  #       "赵九" => 9,
  #       "赵二" => 2,
  #       "赵一" => 1,
  #       "赵拾" => 10
        # },
  #     '2015-02-02' => {
  #        同上
  #     },
  #     '2015-02-03' => {
  #       同上
  #     }
  #   }
  # 详细说明请看 https://github.com/ben7th/yuwan_counter_service/issues/3
  def self.username_section_chat_stat(time_str_type, start_time_str, end_time_str)
    keys = StrTimeUtil.send("#{time_str_type}_str_list", start_time_str, end_time_str)
    result = {}
    keys.each do |key|
      result[key] = self.username_all_chat_stat(time_str_type, key, key)
    end
    result
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

      result = {}
      user_data.each do |item|
        result[item["_id"]] = item["count"]
      end

      result_data[key] = result
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