class Company < ApplicationRecord
  validates :registration_number, presence: true

  after_create_commit :update_payload

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
    # names = results["items"].map { |h| h["nom_complet"] }
  end

  def self.search_fr(query)
    base_url = 'https://recherche-entreprises.api.gouv.fr'
    page = 1
    per_page = 25
    encoded_qery = ERB::Util.url_encode(query)
    url = "#{base_url}/search?q=#{encoded_qery}&page=#{page}&per_page=#{per_page}"
    response = Faraday.get(url)
    results = JSON.parse(response.body)
    # names = results["results"].map { |h| h["nom_complet"] }
  end

  def update_payload
    if self.country_code == "FR"
      results = Company.search_fr(self.registration_number)
      if results["results"].count == 1
        self.update(payload: results["results"].first)
      end
    elsif self.country_code == "UK"
      results = Company.search_uk(self.registration_number)
      if results["items"].count == 1
        self.update(payload: results["items"].first)
      end
    end
  end
end
