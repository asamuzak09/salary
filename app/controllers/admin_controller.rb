class AdminController < ApplicationController

  def new
    @users = User.all
    @time_card = TimeCard.new
  end

  def create
    @user = User.find_by(id: create_params[:user_id])
    @salary = @user.salaries.order(priority: "DESC").first
    @date = Date.parse(create_params[:closing_day])
    @time_card = TimeCard.new(
      user_id: @user.id,
      year: @date.year,
      month: @date.month,
      salary_id: @salary.id,
      closing_date: @date,
      starting_date: @date - 1.month + 1.day
    )
    if @time_card.save
      Shift.shift_create(@time_card,create_params)
      redirect_to("/admin/edit/#{@time_card.id}")
    else
      @users = User.all
      render("/admin/new") 
    end
  end

  def create_params
    params.require(:time_card).permit!.to_h
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

  def public_holiday
    @public_holiday = PublicHoliday.new
    @holidays = PublicHoliday.all.order(date: "DESC").page(params[:page])
  end
  
  def set_holiday
    @public_holiday = PublicHoliday.new(date: params[:public_holiday][:public_holiday])
    if @public_holiday.save
      redirect_to("/admin/public_holiday")
    else
      @holidays = PublicHoliday.all.order(date: "DESC").page(params[:page])
      render("/admin/public_holiday") 
    end
  end
  
  def destroy_holiday
    @public_holiday = PublicHoliday.find_by(id: params[:id])
    @public_holiday.destroy
    redirect_to("/admin/public_holiday") 
  end  

end
