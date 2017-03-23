class Api::V1::RoutesController < ApplicationController
  before_action :authenticate_user!

  def index
    @routes = Route.all
  end

  def create
    @start_point = Marker.new(
                          latitude: params[:latitude],
                          longitude: params[:longitude], 
                          nickname: params[:nickname],
                          address_line1: params[:address_line1],
                          address_line2: params[:address_line2],
                          marker_role: params[:marker_role].to_i,
                          user_id: current_user.id
                        )
    
    if @start_point.save
      @end_point = current_user.markers.where(marker_role: 1).last
      @route = Route.new(
                          origin_id: @start_point.id,
                          work_id: @end_point.id,
                          # preferred: ,
                          status: 0
                        )
      if @route.save
        render :show
      end

    end

  end

  def show
    @route = Route.find(params[:id])
    @start_point = Marker.find_by(id: @route.origin_id)
    @end_point = Marker.find_by(id: @route.work_id)
    p @start_point
    p @end_point
  end
end
