module ExchangeRate
  module Http
    def self.get(base_code, target_code, amount = nil)
      uri = URI.parse("https://v6.exchangerate-api.com/v6/#{ENV["EXCHANGE_RATE_API_KEY"]}/pair/#{base_code}/#{target_code}/#{amount}")
      res = Net::HTTP.get(uri)
      JSON.parse(res)
    end
  end
end
