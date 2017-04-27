class HabitController < ApplicationController
  def set_habit
    @habit = Habit.find_by_id(params[:id])
  end

  get '/habits' do
    if logged_in?
      @habits = Habit.all
      erb :'habits/index'
    else
      redirect to '/login'
    end
  end

  get '/habits/new' do
    if logged_in?
      erb :'habits/new'
    else
      redirect to '/login'
    end
  end

  post '/habits' do
    habit = current_user.habits.new(params[:habit])
    if habit.save
      redirect to '/habits'
    else
      flash[:notice] = "must have a title and description"
      redirect to '/habits/new'
    end
  end

  #Show
  get '/habits/:id' do
    if logged_in?
      set_habit
      erb :'habits/show'
    else
      redirect to '/login'
    end
  end

  get '/habits/:id/edit' do
    if logged_in?
      set_habit
      erb :'habits/edit'
    else
      redirect to '/login'
    end
  end

  patch '/habits/:id' do
    set_habit
    if @habit.update(params[:habit])
      redirect to "/habits/#{@habit.id}"
    else
      redirect to "/habits/#{@habit.id}/edit"
    end
  end

  delete '/habits/:id/delete' do
    set_habit
    if @habit.user == current_user
      @habit.delete
    end
    redirect to '/habits'
  end


end
