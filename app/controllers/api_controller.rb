class ApiController < ApplicationController
  before_filter :set_access_control_headers
  def set_access_control_headers
    response.headers['Access-Control-Allow-Origin']   = request.headers["Origin"]
    response.headers['Access-Control-Allow-Credentials'] = 'true'
  end
  
  def chat_lines

    params[:chat_lines].each do |chat_line|
      talk_time = Time.at(chat_line['talk_time'] / 1000)
      ChatLine.create(
        :room_id => chat_line['room_id'],
        :manager => chat_line['manager'],
        :text => chat_line['room_id'],
        :username => chat_line['username'],
        :userlevel => chat_line['userlevel'],
        :talk_time => talk_time
        :chat_type => chat_line['chat_type']
      )
    end

    render :text => ChatLine.all.length

    # render :nothing => true
  end


end




