class RespondersController < ApplicationController
	before_action :set_responder, only: [:edit, :update, :destroy]

  def index
    @responders = Responder.all
    render json: {responders: @responders}
  end

  def show
  	@responder = Responder.find_by_name(params[:name])
  	if @responder
  		render json: {responder: @responder}
  	else
  		render json: {responder: @responder}, status: 404
  	end
  end

  def create
  	begin
			@responder = Responder.new(responder_params)
      if @responder.save
        render json: {responder: @responder.as_json}, status: 201
      else
        render json: {message: @responder.errors}, status: :unprocessable_entity
      end
    rescue Exception => e
      render json: {message: e.message}, status: :unprocessable_entity
    end
  end


	private
	def responder_params
    params.require(:responder).permit( :type, :name, :capacity)
  end

  def set_responder
	  begin
      @responder = Responder.find(params[:id])
    rescue Exception => e
      render json: { error: I18n.t("responders.not_found"), status: 404 }
    end
  end 
end