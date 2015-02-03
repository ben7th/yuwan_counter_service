class ChatLine

  include Mongoid::Document
  include Mongoid::Timestamps

 
  field :manager,          type: String
  field :text,             type: String
  field :username,         type: String
  field :userlevel,        type: String
  field :talk_time,        type: DateTime
  field :chat_type,        type: String


  validates :room_id, :presence => true



end