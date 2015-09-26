class Api::EventosController < ApplicationController
  before_action :set_evento, only: [:show, :update, :destroy]
  include WardenHelper

  def index
    @eventos = Evento.find_by(owner: current_user)

    if(@eventos.nil? )
      @eventos =  {"eventos" => []}
    end

    render json: @eventos
  end

  def show
    render json: @evento
  end

  def create
    @evento = Evento.new(evento_params)

    if @evento.save
      render json: @evento, status: :created, location: api_evento_url(@evento)
    else
      render json: @evento.errors, status: :unprocessable_entity
    end
  end

  def update
    @evento = Evento.find(params[:id])

    if @evento.update(evento_params)
      head :no_content
    else
      render json: @evento.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @evento.destroy

    head :no_content
  end

  private

  def set_evento
    @evento = Evento.find(params[:id])
  end

  def evento_params
    params.require(:evento).permit(:nombre, :descripcion, :fecha)
  end
end
