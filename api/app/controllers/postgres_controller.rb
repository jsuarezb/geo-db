class PostgresController < ApplicationController
  def nearest
    lat = params[:lat]
    lng = params[:lng]
    n   = params[:n]

    coordinates = Services::Postgres::Nearest.call(lat, lng, n)

    render json: coordinates, status: :ok
  end
end
