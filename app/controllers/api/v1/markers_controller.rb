class Api::V1::MarkersController < ApplicationController
  before_action :authenticate_user!
  def index
    @markers = Marker.all
  end

  def new
    @marker = Marker.new
  end

  def create
    @marker = Marker.new(
                          latitude: params[:latitude],
                          longitude: params[:longitude], 
                          nickname: params[:nickname],
                          address_line1: params[:address_line1],
                          address_line2: params[:address_line2],
                          marker_role: params[:marker_role].to_i,
                          user_id: current_user.id
                        )
    if @marker.save
      render :js => "window.location = '/'"
    else
      render json: {message: "marker not created"}, status: 422
    end

  end

  def show
    @marker = Marker.find(params[:id])
  end
  
end
