class Company < ApplicationRecord
  validates :info, presence: true

  def self.search_uk(query)
    api_key = "YourApiKey"
    # query = "skibby"
    base_url = 'https://api.company-information.service.gov.uk'
    encoded_qery = ERB::Util.url_encode(query)
    url = "#{base_url}/search/companies?q=#{encoded_qery}"
    connection = Faraday.new do |conn|
      conn.headers["Authorization"] = "Basic #{Base64.strict_encode64(api_key)}"
    end
    response = connection.get(url)
    results = JSON.parse(response.body)
    # names = results["results"].map { |h| h["nom_complet"] }
  end

  def self.search_fr(name)
    base_url = 'https://recherche-entreprises.api.gouv.fr'
    page = 1
    per_page = 25
    encoded_name = ERB::Util.url_encode(name)
    url = "#{base_url}/search?q=#{encoded_name}&page=#{page}&per_page=#{per_page}"
    response = Faraday.get(url)
    results = JSON.parse(response.body)
    # names = results["results"].map { |h| h["nom_complet"] }
  end
end
