require 'securerandom'

class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update]

  def show
    render json: @poll 
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
    @response = @poll.responses.find(params[:response][:id])
    @response.votes += 1

    @response.save

    render json: @poll

  end

  private

  def set_poll
    @poll = Poll.find_by(pubId: params[:id])
  end

  def poll_params
    params.require(:poll).permit(:title, :exp_s)  
  end

end
