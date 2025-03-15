module DatosAbiertos
  module Http
    def self.get
      base_url = "https://www.datos.gov.co/resource/32sa-8pi3.json"
      date = 1.day.ago.beginning_of_day.strftime("%Y-%m-%dT%H:%M:%S.%L")
      uri = URI.parse("#{base_url}?$where=vigenciahasta='#{date}'")
      res = Net::HTTP.get(uri)
      JSON.parse(res)
    end
  end
end
