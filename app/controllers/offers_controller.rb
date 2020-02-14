class OffersController < ApplicationController

  def index

    begin
      hotel_offers = $amadeus.shopping.hotel_offers_by_hotel.get(request.query_parameters).data
    rescue Amadeus::ResponseError => error
      raise error
    end

    @offers_list = []
    hotel_offers['offers'].each do |offers_json|
      offer_id = offers_json['id']
      room_description = offers_json['room']['description']['text']
      room_number_of_beds = offers_json['room'].has_key?("typeEstimated") ? offers_json['room']['typeEstimated']['beds'] : "unknown"
      room_bed_type = offers_json['room'].has_key?("typeEstimated") ? offers_json['room']['typeEstimated']['bedType'] : "unknown"
      offer_total_price = offers_json['price']['total']
      offer_price_currency = offers_json['price']['currency']
      offer_cancellation_deadline = offers_json['policies'].has_key?("cancellation") ? offers_json['policies']['cancellation']['deadline'] : "Not cancelable"
      offer = Offer.new(offer_id, room_description, room_number_of_beds, room_bed_type, offer_total_price, offer_price_currency, offer_cancellation_deadline)
      @offers_list.append(offer)
    end

    render action: "index"
  end
end
