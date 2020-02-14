# Amadeus Hotel Booking

We recently released our hotel booking API to give you the chance to integrate hotel booking capabilities directly in your application. In this prototype we demonstrate the end-to-end booking process, which works in conjunction with 2 APIs (and 4 endpoints):
* [Hotel Search](https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-search): to search for the best bookable hotel offers. The Hotel Search API provides 3 endpoints:

  * The 1st endpoint allows you to find a list of hotels in a specific city
  * The 2nd endpoint allows you to get the list of offers (rooms) for a specific hotel id (that you get by using the first endpoint)
  * The last endpoint allows you to confirm the price and the availability before booking a room
* [Hotel Booking](https://developers.amadeus.com/self-service/category/hotel/api-doc/hotel-booking): to book hotel room(s)

## How to run the project locally

Clone the repository.

```sh
git clone hhttps://github.com/amadeus4dev/amadeus-hotel-booking-rubyonrails.git
cd amadeus-hotel-booking-rubyonrails
```

Install the dependencies

```ruby
bundle install
```

For authentication add your API key/secret to your `.bashrc` or `.zshrc` files or export then into your terminal before starting the Rails server

```sh
export AMADEUS_CLIENT_ID=YOUR_API_KEY
export AMADEUS_CLIENT_SECRET=YOUR_API_SECRET
```

You can easily switch between `test` and `production` environments by setting (default to test)

```
export AMADEUS_HOSTNAME="test" # an empty value will also set the environment to test
```

or

```
export AMADEUS_HOSTNAME="production"
```

> Each environment has different API keys. Do not forget to update them!

Finally, run the Django server.

```sh
rails s
```

Finally, open a browser and go to `https://localhost:3000`

## License

This library is released under the [MIT License](LICENSE).

## Help

Our [developer support team](https://developers.amadeus.com/support) is here
to help you. You can find us on
[StackOverflow](https://stackoverflow.com/questions/tagged/amadeus) and
[email](mailto:developers@amadeus.com).
