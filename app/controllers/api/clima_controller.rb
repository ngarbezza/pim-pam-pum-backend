module Api
  class ClimaController < ApplicationController

    def show
      client = YahooWeather::Client.new
      response = nil
      if params[:codigo_woeid]
        response = client.fetch(params[:codigo_woeid])
      elsif params[:nombre_de_ciudad]
        response = client.fetch_by_location(params[:nombre_de_ciudad])
      else
        fail 'No se especificó ciudad o código de ciudad para obtener el clima'
      end

      if response
        render json: {
          ciudad: "#{response.location.city} (#{response.location.country})",
          condicion: response.condition.code('string'),
          temperatura: response.condition.temp,
          unidad_temperatura: response.units.temperature,
          velocidad_viento: response.wind.speed,
          direccion_viento: response.wind.direction('string'),
          porcentaje_humedad: response.atmosphere.humidity,
          presion_atmosferica: response.atmosphere.pressure
        }
      else
        render json: { errors: [
                   'falló el pedido a la API de clima'
               ]}, status: :unprocessable_entity
      end
    end
  end
end
