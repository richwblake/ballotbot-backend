require 'securerandom'

class PollsController < ApplicationController
  def show
    render json: Poll.find_by(pubId: params[:id]) 
  end
  
  def create
    @poll = Poll.new(poll_params)

    @poll.pubId = SecureRandom::uuid

    @poll.save

    params[:responses].each do |key, value|
      @poll.responses.create!(content: value)
    end

    render json: @poll
  end

  def update
    @poll = Poll.find(params[:id])

    @response = @poll.responses.find(params[:response][:id])
    @response.votes += 1

    @response.save

    render json: @poll

  end

  private

  def poll_params
    params.require(:poll).permit(:title, :exp_s)  
  end

end
