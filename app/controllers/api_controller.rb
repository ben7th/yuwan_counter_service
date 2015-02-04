class ApiController < ApplicationController
  layout false


  def chat_line_params
    params.require(:chat_line).permit(
      :room_id, :manager, :text, :username, :userlevel, :talk_time, :chat_type
    )
  end

  
  def chat_lines
    ChatLine.create(chat_line_params)
  end


end




