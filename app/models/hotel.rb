# frozen_string_literal: true

class Hotel
  attr_accessor :name, :hotelId, :latitude, :longitude,
                :amenities, :rating, :hotel_description, :offer_id, :offer_price, :offer_price_currency, :checkInDate, :checkOutDate, :cityCode

  def initialize(name, hotelId, latitude, _longitude, amenities, rating, hotel_description, offer_id, offer_price, offer_price_currency, checkInDate, checkOutDate, cityCode)
    @name = name
    @hotelId = hotelId
    @latitude = latitude
    @amenities = amenities
    @rating = rating
    @hotel_description = hotel_description
    @offer_id = offer_id
    @offer_price = offer_price
    @offer_price_currency = offer_price_currency
    @checkInDate = checkInDate
    @checkOutDate = checkOutDate
    @cityCode = cityCode
  end

  def to_s; end
end
