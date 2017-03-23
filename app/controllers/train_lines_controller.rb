class TrainLinesController < ApplicationController

  def index
    @train_lines = TrainLine.all
  end

  def new
    @train_line = TrainLine.new
  end

  def create
    @train_line = TrainLine.create(
                            name: params[:name],
                            user_id: current_user.id
                          )
    
    redirect_to "/train_lines/#{@train_line.id}"
  end

  def show
    @train_line = TrainLine.find(params[:id])
  end

  def edit
    @train_line = TrainLine.find(params[:id])
  end

  def update
    @train_line = TrainLine.find(params[:id])

    @train_line.update(
                        name: params[:name],
                        user_id: current_user.id
                      )

    redirect_to "/train_lines/#{@train_line.id}"

  end

  def destroy
    @train_line = TrainLine.find(params[:id])
    @train_line.destroy

    redirect_to "/train_lines"
    
  end

  
end
