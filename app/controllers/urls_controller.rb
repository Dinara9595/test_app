class UrlsController < ApplicationController

  def show
    url = Url.find_by(short_url: params[:id])
    url.update(stats: url.stats + 1)
    render json: {"url" => {"long_url" => url.long_url}}
  end

  def create
    url = Url.new(url_params.merge(:short_url => SecureRandom.urlsafe_base64(6)))
    if url.save
      render json: {"url" => {"short_url" => url_url(url.short_url)}}
    else
      render json: "Error"
    end
  end

  def stats
    render json: {"stats" => Url.find_by(short_url: params[:id]).stats}
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
