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

  scope :by_month, ->(start_month, end_month) { 
    where(:talk_time.gte => format(start_month), :talk_time.lte => format(end_month)) 
  }
  scope :by_week, ->(start_week, end_week) { 
    where(:talk_time.gte => format(start_week), :talk_time.lte => format(end_week)) 
  }
  scope :by_day, ->(start_day, end_day) { 
    where(:talk_time.gte => format(start_day), :talk_time.lte => format(end_day)) 
  }
  scope :by_hour, ->(start_hour, end_hour) { 
    where(:talk_time.gte => format(start_hour), :talk_time.lte => format(end_hour)) 
  }
  scope :by_minute, ->(start_minute, end_minute) { 
    where(:talk_time.gte => format(start_minute), :talk_time.lte => format(end_minute)) 
  }

  def self.format(month)
    DateTime.parse(month)
  end

end