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
    
    (@timecard.starting_date..@timecard.closing_date).each do |date|
      date.wday
      @shift = Shift.create(
        time_card_id: @timecard.id,
        kind:kind(),
        date:date,
        start_at:
        rest_minutes:
        end_at:
        preparation:


      )
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
