# frozen_string_literal: true

class HotelsController < ApplicationController
  def index
    begin
      hotels = $amadeus.shopping.hotel_offers.get(request.query_parameters).data
    rescue Amadeus::ResponseError => e
      raise e
    end

    @hotel_list = []
    hotels.each do |hotel_json|
      name = hotel_json['hotel']['name']
      hotelId = hotel_json['hotel']['hotelId']
      latitude = hotel_json['hotel']['latitude']
      longitude = hotel_json['hotel']['longitude']
      amenities = hotel_json['hotel']['amenities']
      rating = hotel_json['hotel']['rating']
      cityCode = hotel_json['hotel']['cityCode']
      checkInDate = params[:checkInDate]
      checkOutDate = params[:checkOutDate]
      hotel_description = hotel_json['hotel'].has_key?('description') ? hotel_json['hotel']['description']['text'] : ""
      offer_id = hotel_json['offers'].first['id']
      offer_price = hotel_json['offers'].first['price']['total']
      offer_price_currency = hotel_json['offers'].first['price']['currency']

      hotel = Hotel.new(name, hotelId, latitude, longitude, amenities, rating, hotel_description, offer_id, offer_price, offer_price_currency, checkInDate, checkOutDate, cityCode)
      @hotel_list.append(hotel)
    end

    render action: 'index'
  end
end
