class AdminController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @salary = @user.salaries.order(priority: "DESC").first
    @date = Date.parse(params[:closing_day])
    @timecard = TimeCard.create(
      user_id: @user.id,
      year: @date.year,
      month: @date.month,
      salary_id: @salary.id,
      closing_date: @date,
      starting_date: @date - 1.month + 1.day
    )
    @pubholidays = PublicHoliday.pluck(:date)

    (@timecard.starting_date..@timecard.closing_date).each do |date|
      if @pubholidays.include?(date)
        @start_at = Time.parse("00:00")
        @rest = 0
        @end_at = Time.parse("00:00")
      elsif date.wday == 1
        @start_at = Time.parse("#{params[:'mon_start(4i)']}:#{params[:'mon_start(5i)']}")
        @rest = params[:"mon_rest(4i)"].to_i * 60 + params[:"mon_rest(5i)"].to_i
        @end_at = Time.parse("#{params[:'mon_end(4i)']}:#{params[:'mon_end(5i)']}")
      elsif date.wday == 2
        @start_at = Time.parse("#{params[:'tue_start(4i)']}:#{params[:'tue_start(5i)']}")
        @rest = params[:"tue_rest(4i)"].to_i * 60 + params[:"tue_rest(5i)"].to_i
        @end_at = Time.parse("#{params[:'tue_end(4i)']}:#{params[:'tue_end(5i)']}")
      elsif date.wday == 3
        @start_at = Time.parse("#{params[:'wed_start(4i)']}:#{params[:'wed_start(5i)']}")
        @rest = params[:"wed_rest(4i)"].to_i * 60 + params[:"wed_rest(5i)"].to_i
        @end_at = Time.parse("#{params[:'wed_end(4i)']}:#{params[:'wed_end(5i)']}")
      elsif date.wday == 4
        @start_at = Time.parse("#{params[:'thu_start(4i)']}:#{params[:'thu_start(5i)']}")
        @rest = params[:"thu_rest(4i)"].to_i * 60 + params[:"thu_rest(5i)"].to_i
        @end_at = Time.parse("#{params[:'thu_end(4i)']}:#{params[:'thu_end(5i)']}")
      elsif date.wday == 5
        @start_at = Time.parse("#{params[:'fri_start(4i)']}:#{params[:'fri_start(5i)']}")
        @rest = params[:"fri_rest(4i)"].to_i * 60 + params[:"fri_rest(5i)"].to_i
        @end_at = Time.parse("#{params[:'fri_end(4i)']}:#{params[:'fri_end(5i)']}")
      elsif date.wday == 6
        @start_at = Time.parse("#{params[:'sat_start(4i)']}:#{params[:'sat_start(5i)']}")
        @rest = params[:"sat_rest(4i)"].to_i * 60 + params[:"sat_rest(5i)"].to_i
        @end_at = Time.parse("#{params[:'sat_end(4i)']}:#{params[:'sat_end(5i)']}")
      else
        @start_at = Time.parse("#{params[:'sun_start(4i)']}:#{params[:'sun_start(5i)']}")
        @rest = params[:"sun_rest(4i)"].to_i * 60 + params[:"sun_rest(5i)"].to_i
        @end_at = Time.parse("#{params[:'sun_end(4i)']}:#{params[:'sun_end(5i)']}")
      end 
      @shift = Shift.create(
       time_card_id: @timecard.id,
       kind:kind(@start_at,@end_at),
       date:date,
       start_at: @start_at,
       rest_minutes: @rest,
       end_at: @end_at,
       preparation: params[:"preparation(4i)"].to_i * 60 + params[:"preparation(5i)"].to_i
      )
    end
    
    redirect_to("/admin/edit/#{@timecard.id}")
  end

  def index
    @cards = TimeCard.all.order(closing_date: "DESC").page(params[:page])
  end

  def edit
    @timecard = TimeCard.find_by(id: params[:id])
    @shifttotal = 0
  end

  def update
    @timecard = TimeCard.find_by(id: params[:timecard_id])
    @error_flag = false
    params[:working_hour].each do |working_day|
      @working = WorkingHour.find_or_initialize_by(
        shift_id: working_day[:shift_id]
      )
      @working.punch_in = Time.parse("#{working_day[:"day_start"]["(4i)"]}:#{working_day[:"day_start"]["(5i)"]}")
      @working.rest_minutes = working_day[:"day_rest"]["(4i)"].to_i * 60 + working_day[:"day_rest"]["(5i)"].to_i
      @working.punch_out = Time.parse("#{working_day[:"day_end"]["(4i)"]}:#{working_day[:"day_end"]["(5i)"]}") 
      if @working.save
   
      else
        @error_flag = true
        break
      end
    end
    if @error_flag
      render("/admin/edit/#{@timecard.id}") 
    else
      redirect_to("/admin/#{@timecard.id}")   
    end  
  end

  def show
    @timecard = TimeCard.find_by(id: params[:id])
    @shifttotal = 0
    @worktotal = 0
    @holidayworktotal = 0
    @worktimes = 0
    @holidayworktimes = 0
    @overtimetotal = 0
  end  
  
  def destroy
    @timecard = TimeCard.find_by(id: params[:id])
    @timecard.destroy
    redirect_to("/admin/index") 
  end

  def kind(start,ending)
    if ending == start
      :holiday
    else
      :working_day  
    end  
  end
  
  def worktime(start,rest,ending)
    (ending - start - rest * 60)/60
  end

  def dworktime(start,rest,ending,prepare)
    "#{(ending - start - rest * 60 - prepare * 60).floor/3600}".rjust(2,"0") + ":" + "#{(ending - start - rest * 60 ).floor%3600/60}".rjust(2,"0")
  end

end
