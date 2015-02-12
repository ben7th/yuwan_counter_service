class ApiController < ApplicationController
  before_filter :set_access_control_headers
  def set_access_control_headers
    if !request.headers["Origin"].blank?
      response.headers['Access-Control-Allow-Origin']   = request.headers["Origin"]
    end
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
      :yuwan_count   => current_room['yuwan_count'],
      :time => Time.at(current_room['time'].to_i / 1000)
    )

    render :nothing => true
  end


  def chat_lines_stat
    # 指定要查询的聊天记录类型，不传这个参数时就查询全部的，参数为用逗号连接的多个类型组成的字符串"chat,welcome,forbid,yuwan"
    #for
    if params[:for].blank?
      chat_line_types = ['chat','welcome','forbid','yuwan']
    else
      chat_line_types = params[:for].split(",")
    end

    room_id = params[:room_id]
    by      = params[:by]
    start_str = params[:start]
    end_str   = params[:end]

    data = ChatLine.
      by_room_id(room_id).
      in(chat_type: chat_line_types).
      send("by_#{by}", start_str, end_str)

    render :json => {
      :by   => by,
      :data => data
    }
  end

  def username_chat_stat
    room_id = params[:room_id]
    by      = params[:by]
    start_str = params[:start]
    end_str   = params[:end]

    data_all = ChatLine.
      by_room_id(room_id).
      username_all_chat_stat(by, start_str, end_str)
    data_section = ChatLine.
      by_room_id(room_id).
      username_section_chat_stat(by, start_str, end_str)

    render :json => {
      :by   => by,
      :data => {
        :all => data_all,
        :section => data_section
      }
    }
  end

  def username_yuwan_stat
    room_id = params[:room_id]
    by      = params[:by]
    start_str = params[:start]
    end_str   = params[:end]

    data = ChatLine.
      by_room_id(room_id).
      username_yuwan_stat(by, start_str, end_str) 

    render :json => {
      :by   => by,
      :data => data
    }
  end

end




