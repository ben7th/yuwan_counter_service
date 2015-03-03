module ChatLineSearchConfig
  extend ActiveSupport::Concern 

  included do
    include Searchable

    settings :index => {:number_of_shards => 1}, :analysis => custom_analysis do
      mappings :dynamic => "false" do
        indexes :text, :analyzer => :chargram
        indexes :room_id,   :type => :long
        indexes :talk_time, :type => :date, :format => "dateOptionalTime"
        indexes :chat_type
      end
    end

  end

  module ClassMethods
    #　options 格式
    #　{
    #    :start_time_str => "2015-02-05T19:32:26.000+08:00"
    #    :end_time_str => "2015-02-05T19:32:26.000+08:00"
    #  }
    #     lt:   "2015-02-14T23:35:29.000+08:00", 
    # gt: "2015-02-04T22:35:29.000+08:00"
    def chat_search(room_id,query,options = {})
      start_time_str = options[:start_time_str]
      end_time_str = options[:end_time_str]
      if start_time_str.blank? && end_time_str.blank?
        time_range = nil
      end
      if !start_time_str.blank? && end_time_str.blank?
         time_range = { range: { talk_time: {gt: start_time_str} } }
      end
      if start_time_str.blank? && !end_time_str.blank?
         time_range = { range: { talk_time: {lt: end_time_str} } }
      end
      if !start_time_str.blank? && !end_time_str.blank?
        time_range = { range: { talk_time: { gt: start_time_str, lt: end_time_str } } }
      end

      param = {
        :query => {
          :bool => {
            :must => [
              {
                :multi_match => {
                  :fields   => [:text],
                  :type     => :phrase,
                  :query    => query,
                  :analyzer => :chargram
                }
              },
              {term: {room_id: room_id}},
              {term: {chat_type: 'chat'}}
            ]
          }
        },

        :highlight => {
          :pre_tags => ["<em class='highlight'>"],
          :post_tags => ["</em>"],
          :fields => {:text=>{}}
        }
      }

      if !time_range.blank?
        param[:query][:bool][:must].push time_range
      end
      ChatLine.search(param)
    end

  end

end