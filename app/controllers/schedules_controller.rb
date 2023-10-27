class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @schedules_total = Schedule.all.count(:id)
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_date, :end_date, :is_all_day, :memo))
     if @schedule.save
      flash[:success] = "スケジュールを登録しました"
       redirect_to :schedules
     else
      flash[:failure] = "スケジュールを登録できませんでした"
       render "new"
     end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_date, :end_date, :is_all_day, :memo))
      flash[:success] = "スケジュールを更新しました"
      redirect_to :schedules
    else
      flash[:failure] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
     @schedule.destroy
     redirect_to :schedules
  end
end
