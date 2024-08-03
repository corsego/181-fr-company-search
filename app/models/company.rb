class Company < ApplicationRecord
  validates :info, presence: true

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
