# For API use
require 'open-uri'

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # @tasks = Task.where(:start_date => Date.today..Date.today)

  end

  def all
    @tasks = Task.all
  end

# for intelligent task filling
  # def active_task
  #   @task.start_date = params[:start_date]
  #   @today = Date.today
  #   @active_task =
  # end


  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.status = params[:status]
    @task.create_date = params[:create_date]
    @task.start_date = params[:start_date]
    @task.complete = params[:complete]
    @task.category_id = params[:category_id]
    @task.due_on = params[:due_on]
    @task.user_id = params[:user_id]
    @task.description = params[:description]

    if @task.save
      redirect_to "/tasks", :notice => "Task created successfully."
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.status = params[:status]
    @task.create_date = params[:create_date]
    @task.start_date = params[:start_date]
    @task.complete = params[:complete]
    @task.category_id = params[:category_id]
    @task.due_on = params[:due_on]
    @task.user_id = params[:user_id]
    @task.description = params[:description]

    if @task.save
      redirect_to "/tasks", :notice => "Task updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to "/tasks", :notice => "Task deleted."
  end

  # Show today's date
  def current
    ::Time.zone ? ::Time.zone.today : ::Date.today
  end

  #Weather API for a given location

  def city_to_weather

    # City
    # @city = params[:user_city]
    # url_safe_city = URI.encode(@city)

    # # Location mapping (wait until setup is availbe)
    # google_url = "http://maps.googleapis.com/maps/api/geocode/json?address="
    # parsed_mapdata = JSON.parse(open(google_url+url_safe_city).read)
    # @lat = parsed_mapdata["results"][0]["geometry"]["location"]["lat"]
    # @lng = parsed_mapdata["results"][0]["geometry"]["location"]["lng"]

    # Weather mapping

    # location_url = @lat.to_s+','+@lng.to_s
    # Chicago: 41.8369,-87.6847 (Hard code lat and long to try and get it working)
    location_url = '41.8369,-87.6847'
    darksky_url = "https://api.forecast.io/forecast/12ab4de221b5a6cd202b2ec39cfa700f/"

    parsed_data = JSON.parse(open(darksky_url+location_url).read)

    @current_summary = parsed_data["currently"]["summary"]

    # Future days

    # https://api.forecast.io/forecast/APIKEY/LATITUDE,LONGITUDE,TIME
    # locationtime_url = @lat.to_s+','+@lng.to_s+','+(Date.today+1).to_s
    # parsed_data_time = JSON.parse(open(darksky_url+locationtime_url).read)

    # @future_summary = parsed_data_time["daily"]["summary"]

    # render to 'index.html.erb' of to '/tasks'
    render("/tasks")

  end



















end
