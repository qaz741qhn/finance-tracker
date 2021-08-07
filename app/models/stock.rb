class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key], endpoint: 'https://sandbox.iexapis.com')
    client.price(ticker_symbol)
  end
end
