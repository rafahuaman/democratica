class FindCongressionalDistrictController < ApplicationController
  def index
    address = params[:address]
    city = params[:city]
    state = params[:state]
    geo_results = Geocoder.search("#{address}, #{city}, #{state}")
    latitude = geo_results.first.latitude
    longitude = geo_results.first.longitude
    district_object = Congress.districts_locate(latitude, longitude)
    district = district_object['results'].first.district.ordinalize
    @found_message = "The address entered belong's to #{state}'s #{district} congressional district"
    respond_to do |format|
      format.js
    end
  end
end