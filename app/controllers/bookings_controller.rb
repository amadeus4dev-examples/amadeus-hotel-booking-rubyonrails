# frozen_string_literal: true

require 'json'

class BookingsController < ApplicationController
  def index
    @offer_id = params['offerId']
    begin
      response = $amadeus.shopping.hotel_offer(@offer_id).get
      if response.status_code == 200
        render action: 'index'
      elsif
        raise error
      end
    rescue Amadeus::ResponseError => e
      raise e
    end
  end

  def book
    offer_id = params['offer_id']
    title = params['title']
    first_name = params['first_name']
    last_name = params['last_name']
    phone = params['phone']
    email = params['email']
    type_card = params['type_card']
    card_number = params['card_number']
    expiry_date = params['expiry_date']
    special_request = params['special_request']

    payments = [
      {
        'id' => 1,
        'method' => 'creditCard',
        'card' => {
          'vendorCode' => type_card,
          'cardNumber' => card_number,
          'expiryDate' => expiry_date
        }
      }
    ]

    guests = [
      {
        'id' => 1,
        'name' => {
          'title' => title,
          'firstName' => first_name,
          'lastName' => last_name
        },
        'contact' => {
          'phone' => phone,
          'email' => email
        }
      }
    ]

    begin
      @booking = $amadeus.booking.hotel_bookings.post(offer_id, guests, payments).data
    rescue Amadeus::ResponseError => e
      raise e
    end

    render action: 'confirmed'
  end
end
