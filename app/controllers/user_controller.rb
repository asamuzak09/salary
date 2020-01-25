class UserController < ApplicationController
    def index
      @users = User.all
    end
    
    def new
      @user = User.new
      @salary = Salary.new
    end

    def create
      @user = User.new(name1: params[:name1],name2: params[:name2])
      @salary = Salary.new(
          user_id: 0,#fake
          payment: params[:payment],
          overtime_pay: params[:overtime_pay],
          holiday_pay: params[:holiday_pay],
          priority: 1
        )
      if @user.valid? == false || @salary.valid?
        render("user/new")
      else

        ActiveRecord::Base.transaction do
          @user.save
          @salary.user_id = @user.id 
          @salary.save
        end
      
        redirect_to("/users/index")
      end  
    end
    
    def edit
      @user = User.find_by(id: params[:id])
    end
    
    def update
      @user = User.find_by(id: params[:id])
      @user.name1 = params[:name1]
      @user.name2 = params[:name2]
      if @user.valid? == false
        render("user/edit")
      else
        @user.save
        redirect_to("/users/index")
      end 

    end
    
    def show

    end
    
    def destroy
      @user = User.find_by(id: params[:id])
      @user.destroy
      redirect_to("/users/index")
    end
    
    def salaryedit
      @user = User.find_by(id: params[:id])
      @salary = Salary.where(user_id: @user.id).order(priority: "DESC").first
      
    end
    
    def salaryupdate
      @user = User.find_by(id: params[:id])
      @salary = Salary.new(
        user_id: @user.id,
        priority: salarypriority(@user),
        payment: params[:payment],
        overtime_pay: params[:overtime_pay],
        holiday_pay: params[:holiday_pay]
      )
      if @salary.valid? == false
        render("user/salaryedit")
      else
        @salary.save
        redirect_to("/users/index")
      end
    end

    def salarytotal
      @timecard = TimeCard.find_by(id: params[:id])
      (@timecard.starting_date..@timecard.closing_date).each do |date|
        @shift = @timecard.shifts.find_by(date: date)  
      end  
    end  

    
    def salarypriority(user)
      @priority = Salary.where(user_id: user.id).order(priority: "DESC").first.priority + 1
    end  
end