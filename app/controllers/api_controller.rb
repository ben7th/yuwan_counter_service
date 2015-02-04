class ApiController < ApplicationController
  before_filter :set_access_control_headers
  def set_access_control_headers
    response.headers['Access-Control-Allow-Origin']   = request.headers["Origin"]
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
  
  def chat_lines

    params[:chat_lines].each do |index, chat_line|
      talk_time = Time.at(chat_line['talk_time'].to_i / 1000)
      ChatLine.create(
        :room_id => chat_line['room_id'],
        :manager => chat_line['manager'],
        :text => chat_line['text'],
        :username => chat_line['username'],
        :userlevel => chat_line['userlevel'],
        :talk_time => talk_time,
        :chat_type => chat_line['chat_type']
      )
    end

    render :nothing => true
  end



  def room_status

    current_room = params[:room_status]

    RoomStatus.create(
      :room_id => current_room['room_id'],
      :follow_count => current_room['follow_count'],
      :online_number => current_room['online_number'],
      :time => Time.at(current_room['time'].to_i / 1000)
    )

    render :nothing => true
  end


end




