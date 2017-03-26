class RoutesController < ApplicationController
  before_action :authenticate_user!
  def index
    
  end

  def location
    
  end

  def location3
    
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.create(
                            origin_id: params[:route][:origin_id],
                            work_id: params[:route][:work_id],
                            preferred: params[:route][:preferred],
                            status: 1
                          )
    
    redirect_to "/routes/#{@route.id}"
  end

  def show
    @route = Route.find(params[:id])
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])

    @route.update(
                    origin_id: params[:route][:origin_id],
                    work_id: params[:route][:work_id],
                    preferred: params[:route][:preferred],
                    status: 1
                  )
    redirect_to "/routes/#{@route.id}"

  end

  def destroy
    @route = route.find(params[:id])
    @route.destroy

    redirect_to "/routes"
    
  end
end
