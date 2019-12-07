class AdminController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @salary = Salary.where(user_id: @user.id).order(priority: "DESC").first
    @date = Date.parse(params[:closing_day])
    @timecard = TimeCard.create(
      user_id: @user.id,
      year: @date.year,
      month: @date.month,
      salary_id: @salary.id,
      closing_date: @date,
      starting_date: @date - 1.month + 1.day
    )
    raise
    (@timecard.starting_date..@timecard.closing_date).each do |date|
     if date.wday == 1
      @start_at = Time.parse("#{params[:'mon_start(4i)']}:#{params[:'mon_start(5i)']}")
      @rest = params[:mon_rest(4i)].to_i * 60 + params[:mon_rest(4i)].to_i
      @end_at = Time.parse("#{params[:'mon_end(4i)']}:#{params[:'mon_end(5i)']}")
     elsif date.wday == 2
      
     elsif date.wday == 3

     elsif date.wday == 4
      
     elsif date.wday == 5
      
     elsif date.wday == 6

     else
      
     end 

    #  @shift = Shift.create(
    #    time_card_id: @timecard.id,
    #    kind:kind(),
    #    date:date,
    #    start_at: @start_at
    #    rest_minutes: @rest
    #    end_at: @end_at
    #    preparation:


    #  )
    end
    
    redirect_to("/admin/edit/#{@timecard.id}")
  end
  
  def edit
    @timecard = TimeCard.find_by(id: params[:id])
  end 
  
  def kind(start,ending)
    if ending == start
      :holiday
    else
      :working_day  
    end  
  end  
  
end
