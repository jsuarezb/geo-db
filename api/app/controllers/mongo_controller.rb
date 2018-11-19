class MongoController < ApplicationController
  def nearest
    lat = params[:lat].to_f
    lng = params[:lng].to_f
    n   = params[:n].to_i
    with_index = params[:index].to_i == 0 ? false : true
    threshold  = params[:th].to_f

    start_time = Time.now
    nearest    = Services::Mongo::Nearest.call(lat, lng, n)
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
