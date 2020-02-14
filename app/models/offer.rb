# frozen_string_literal: true

class Offer
  attr_accessor :offer_id, :room_description, :room_number_of_beds, :room_bed_type, :offer_total_price, :offer_price_currency, :offer_cancellation_deadline

  def initialize(offer_id, room_description, room_number_of_beds, room_bed_type, offer_total_price, offer_price_currency, offer_cancellation_deadline)
    @offer_id = offer_id
    @room_description = room_description
    @room_number_of_beds = room_number_of_beds
    @room_bed_type = room_bed_type
    @offer_total_price = offer_total_price
    @offer_price_currency = offer_price_currency
    @offer_cancellation_deadline = offer_cancellation_deadline
  end

  def to_s; end
end
