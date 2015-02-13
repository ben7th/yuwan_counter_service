class RoomStatus

  include Mongoid::Document
  include Mongoid::Timestamps

  field :room_id,          type: Integer
  field :follow_count,     type: Integer
  field :online_number,    type: Integer
  field :yuwan_count,      type: String
  field :time,             type: DateTime


  validates :room_id, :presence => true

  # result 格式
  # {
  #   "2015-02-10" => {
  #     # 房间关注数
  #     "follow_count"  => 11,
  #     # 房间观众数
  #     "online_number" => 11,
  #     # 房间鱼丸总数
  #     "yuwan_count"   => "1T"
  #   },
  #   "2015-02-11" => {
  #     # 房间关注数
  #     "follow_count"  => 11,
  #     # 房间观众数
  #     "online_number" => 11,
  #     # 房间鱼丸总数
  #     "yuwan_count"   => "1T"
  #   },
  #   "2015-02-12" => {
  #     # 房间关注数
  #     "follow_count"  => 11,
  #     # 房间观众数
  #     "online_number" => 11,
  #     # 房间鱼丸总数
  #     "yuwan_count"   => "1T"
  #   }
  # }

  # 详细说明 https://github.com/ben7th/yuwan_counter_service/issues/6
  def self.stat(room_id, time_str_type, start_time_str, end_time_str)
    keys = StrTimeUtil.send("#{time_str_type}_str_list", start_time_str, end_time_str)
    result = {}
    keys.each do |key|
      start_time = StrTimeUtil.send("start_#{time_str_type}_str_to_time", key)
      end_time   = StrTimeUtil.send("end_#{time_str_type}_str_to_time", key)
      room_status = self.where(
          :time.gte => start_time, 
          :time.lt => end_time,
          :room_id => room_id
        ).order_by(:time => 'asc').first
      
      if !room_status.blank?
        data = {
          "follow_count"  => room_status.follow_count,
          "online_number" => room_status.online_number,
          "yuwan_count"   => room_status.yuwan_count || ""
        }
      else
        data = {
          "follow_count"  => 0,
          "online_number" => 0,
          "yuwan_count"   => ""
        }
      end
      result[key] = data
    end
    result
  end

end