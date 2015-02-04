class RoomStatus

  include Mongoid::Document
  include Mongoid::Timestamps

  field :room_id,          type: Integer
  field :follow_count,     type: Integer
  field :online_number,    type: Integer
  field :time,             type: DateTime


  validates :room_id, :presence => true



end