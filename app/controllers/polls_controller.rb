class PollsController < ApplicationController
  def show
    render json: Poll.find(params[:id]) 
  end
  
  def create
    @poll = Poll.create!(poll_params)

    params[:responses].each do |key, value|
      @poll.responses.create!(content: value)
    end

    render json: @poll
  end

  private

  def poll_params
    params.require(:poll).permit(:title)  
  end

end
