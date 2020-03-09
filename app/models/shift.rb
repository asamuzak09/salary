class Shift < ApplicationRecord
    belongs_to :time_card
    has_one :working_hour, dependent: :destroy
    
    def self.kind(start,ending)
        if ending == start
          :holiday
        else
          :working_day  
        end  
    end

    def self.shift_create(time_card,create_params)

      @pubholidays = PublicHoliday.pluck(:date)

      (time_card.starting_date..time_card.closing_date).each do |date|
        if @pubholidays.include?(date)
          @start_at = Time.parse("00:00")
          @rest = 0
          @end_at = Time.parse("00:00")
        elsif date.wday == 1
          @start_at = Time.parse("#{create_params[:'mon_start(4i)']}:#{create_params[:'mon_start(5i)']}")
          @rest = create_params[:"mon_rest(4i)"].to_i * 60 + create_params[:"mon_rest(5i)"].to_i
          @end_at = Time.parse("#{create_params[:'mon_end(4i)']}:#{create_params[:'mon_end(5i)']}")
        elsif date.wday == 2
          @start_at = Time.parse("#{create_params[:'tue_start(4i)']}:#{create_params[:'tue_start(5i)']}")
          @rest = create_params[:"tue_rest(4i)"].to_i * 60 + create_params[:"tue_rest(5i)"].to_i
          @end_at = Time.parse("#{create_params[:'tue_end(4i)']}:#{create_params[:'tue_end(5i)']}")
        elsif date.wday == 3
          @start_at = Time.parse("#{create_params[:'wed_start(4i)']}:#{create_params[:'wed_start(5i)']}")
          @rest = create_params[:"wed_rest(4i)"].to_i * 60 + create_params[:"wed_rest(5i)"].to_i
          @end_at = Time.parse("#{create_params[:'wed_end(4i)']}:#{create_params[:'wed_end(5i)']}")
        elsif date.wday == 4
          @start_at = Time.parse("#{create_params[:'thu_start(4i)']}:#{create_params[:'thu_start(5i)']}")
          @rest = create_params[:"thu_rest(4i)"].to_i * 60 + create_params[:"thu_rest(5i)"].to_i
          @end_at = Time.parse("#{create_params[:'thu_end(4i)']}:#{create_params[:'thu_end(5i)']}")
        elsif date.wday == 5
          @start_at = Time.parse("#{create_params[:'fri_start(4i)']}:#{create_params[:'fri_start(5i)']}")
          @rest = create_params[:"fri_rest(4i)"].to_i * 60 + create_params[:"fri_rest(5i)"].to_i
          @end_at = Time.parse("#{create_params[:'fri_end(4i)']}:#{create_params[:'fri_end(5i)']}")
        elsif date.wday == 6
          @start_at = Time.parse("#{create_params[:'sat_start(4i)']}:#{create_params[:'sat_start(5i)']}")
          @rest = create_params[:"sat_rest(4i)"].to_i * 60 + create_params[:"sat_rest(5i)"].to_i
          @end_at = Time.parse("#{create_params[:'sat_end(4i)']}:#{create_params[:'sat_end(5i)']}")
        else
          @start_at = Time.parse("#{create_params[:'sun_start(4i)']}:#{create_params[:'sun_start(5i)']}")
          @rest = create_params[:"sun_rest(4i)"].to_i * 60 + create_params[:"sun_rest(5i)"].to_i
          @end_at = Time.parse("#{create_params[:'sun_end(4i)']}:#{create_params[:'sun_end(5i)']}")
        end 
        @shift = Shift.create(
        time_card_id: time_card.id,
        kind:Shift.kind(@start_at,@end_at),
        date:date,
        start_at: @start_at,
        rest_minutes: @rest,
        end_at: @end_at,
        preparation: create_params[:"preparation(4i)"].to_i * 60 + create_params[:"preparation(5i)"].to_i
        )
      end

    end
    
end
