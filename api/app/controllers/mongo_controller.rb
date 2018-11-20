class MongoController < ApplicationController
  def nearest
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    n   = params[:n].to_i
    threshold  = params[:th].to_f
    method     = params[:method]

    start_time = Time.now
    nearest    =
      case method
      when '2dsphere' then Services::Mongo::Nearest.call_sphere(lat, lng, n, threshold)
      when '2d'       then Services::Mongo::Nearest.call_normal(lat, lng, n, threshold)
      end
    end_time   = Time.now
    result     = { result: nearest, query_milliseconds: (end_time - start_time) * 1000 }

    render json: result, status: :ok
  end

  def info
    lat = params[:lat].to_f
    lng = params[:lng].to_f

    start_time = Time.now
    info       = Services::Mongo::Info.call(lat, lng)
    end_time   = Time.now
    result     = { result: nearest, query_milliseconds: (end_time - start_time) * 1000 }

    render json: result, status: :ok
  end
end
