class RespondersController < ApplicationController
	before_action :set_responder, only: [:show, :edit, :update, :destroy]

  def index
    @responders = Responder.all
    render json: @responders
  end

  def show
    respond_to do |format|
      format.json { render json: @responder }
    end
  end

  def create
		@responder = Responder.new(responder_params)
    respond_to do |format|
      if @responder.save
        format.json { render json: @responder, status: 201}
      else
        format.json { render json: @responder.errors, status: :unprocessable_entity }
      end
    end
	end


	private
	def responder_params
    params.require(:responder).permit(:emergency_code, :type, :name, :capacity, :on_duty)
  end

  def set_responder
	  begin
      @responder = Responder.find(params[:id])
    rescue Exception => e
      render json: { error: I18n.t("responders.not_found"), status: 404 }
    end
  end 
end