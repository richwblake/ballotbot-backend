require 'securerandom'

class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :update]

  def options
    headers["Access-Control-Allow-Methods"] = "POST"
    headers["Access-Control-Allow-Origin"] = "*"
  end

  def show
    render json: @poll 
  end
  
  def create
    @poll = Poll.new(poll_params)

    @poll.pubId = SecureRandom::uuid

    @poll.exp_s = params[:exp_s]

    @poll.save

    params[:responses].each do |key, value|
      @poll.responses.create!(content: key[:content], pubId: SecureRandom::uuid)
    end

    render json: @poll
  end

  def update
    @response = @poll.responses.find_by(pubId: params[:response][:id])
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
