class MarkersController < ApplicationController
  before_action :authenticate_user!
  def index
    @markers = Marker.all

    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    search_term = params[:search_term]
    marker_role = params[:marker_role]

    if search_term
      @markers = @markers.where("nickname iLIKE ? OR address_line1 iLIKE ? OR address_line2 iLIKE ?", 
                                "%#{search_term}%",
                                "%#{search_term}%",
                                "%#{search_term}%",
                                )
    end
    
    if marker_role
      @markers = Marker.find_by(marker_role: marker_role)
    end

    if sort_attribute && sort_order
      @markers = @markers.order(sort_attribute => sort_order)
    end
  end

  def new
    @marker = Marker.new
  end

  def create
    @marker = Marker.create(
                            latitude: params[:latitude],
                            longitude: params[:longitude], 
                            nickname: params[:nickname],
                            address_line1: params[:address_line1],
                            address_line2: params[:address_line2],
                            marker_role: 1,
                            user_id: current_user.id
                          )
    
    redirect_to "/markers/#{@marker.id}"
  end

  def show
    @marker = Marker.find(params[:id])
  end

  def edit
    @marker = Marker.find(params[:id])
  end

  def update
    @marker = Marker.find(params[:id])

    @marker.update(
                   latitude: params[:latitude],
                   longitude: params[:longitude], 
                   nickname: params[:nickname],
                   address_line1: params[:address_line1],
                   address_line2: params[:address_line2],
                   marker_role: params[:marker][:marker_role].to_i,
                   user_id: current_user.id
                  )
    redirect_to "/markers/#{@marker.id}"

  end

  def destroy
    @marker = Marker.find(params[:id])
    @marker.destroy

    redirect_to "/markers"
    
  end
  
end
