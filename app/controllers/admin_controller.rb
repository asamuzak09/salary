class AdminController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @salary = Salary.where(user_id: @user.id).order(priority: "DESC").first
    @timecard = TimeCard.create(user_id: @user.id, year: params["date(1i)"], month: params["date(2i)"], salary_id: @sarary.id)

  end  
end
