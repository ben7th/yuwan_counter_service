class ApiController < ApplicationController

  
  def chat_lines

    params[:chat_lines].each do |chat_line|
      # chat_line_params = chat_line
      ChatLine.create(
        :room_id => chat_line['room_id'],
        :manager => chat_line['manager'],
        :text => chat_line['room_id'],
        :username => chat_line['username'],
        :userlevel => chat_line['userlevel'],
        :talk_time => chat_line['talk_time'],
        :chat_type => chat_line['chat_type']
      )
    end

    render :text => ChatLine.all.length

    # render :nothing => true
  end


end




