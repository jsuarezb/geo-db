class PostgresController < ApplicationController
  def nearest
    lat = params[:lat]
    lng = params[:lng]
    n   = params[:n]
    with_index = params[:index].to_i == 0 ? false : true
    threshold  = params[:th].to_f
    spheroid   = params[:spheroid].to_i == 0 ? false : true
    method     = params[:method]

    start_time = Time.now
    nearest    =
      case method
      when 'within' then Services::Postgres::Nearest.within(lat, lng, n, with_index, threshold, spheroid)
      else               Services::Postgres::Nearest.distance(lat, lng, n, with_index, threshold, spheroid)
      end
    end_time   = Time.now
    result     = { result: nearest, query_milliseconds: (end_time - start_time) * 1000 }

    render json: result, status: :ok
  end

  def info
    lat = params[:lat]
    lng = params[:lng]
    with_index = params[:n].to_i == 0 ? false : true
    spheroid   = params[:spheroid].to_i == 0 ? false : true

    start_time = Time.now
    info       = Services::Postgres::Info.call(lat, lng, with_index)
    end_time   = Time.now
    result     = { result: nearest, query_milliseconds: (end_time - start_time) * 1000 }

    render json: result, status: :ok
  end
end
