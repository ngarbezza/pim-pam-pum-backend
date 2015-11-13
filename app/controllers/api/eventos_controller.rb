class Api::EventosController < ApplicationController
  before_action :set_evento, only: [:show, :update, :destroy, :confirmados]

  def index
    @eventos = Evento.where(owner: current_user)

    render json: @eventos
  end

  def show
    render json: @evento
  end

  def create
    @evento = Evento.new(evento_params)
    @evento.owner = current_user

    if @evento.save
      render json: @evento, status: :created, location: api_evento_url(@evento)
    else
      render status: 422, json: {errors: @evento.errors}.to_json
    end
  end

  def update
    @evento = Evento.find(params[:id])

    if @evento.update(evento_params)
      head :no_content
    else
      render status: 422, json: {errors: @evento.errors}.to_json
    end
  end

  def destroy
    @evento.destroy

    head :no_content
  end

  def confirmados
    render json: { confirmados: @evento.confirmados.map { |confirmado| invitacion_response(confirmado) } }
  end

  private

  def invitacion_response(invitacion)
    { id: invitacion.user.id, nombreUsuario: invitacion.user.username }
  end

  def set_evento
    @evento = Evento.find(params[:id])
  end

  def evento_params
    params.require(:evento).permit(:nombre, :descripcion, :fecha, :direccion)
  end
end
