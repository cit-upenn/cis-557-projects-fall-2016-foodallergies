# == Schema Information
#
# Table name: food_apis
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FoodApi < ActiveRecord::Base
# APIKey = 'a7F2g1799I3BHllnceNTKQuS4Dm0E1hdqmUS42oO'

  class << self

    def query_url(keyword)
     @keyword = keyword
     @SYNCHRONIZER_TOKEN = '9dcdc3ab-132e-4c7e-94ca-0eb606b3ca3c'
     @host = 'ndb.nal.usda.gov'
     @SYNCHRONIZER_URI = '/ndb/search/list'

     URI::HTTP.build(
       host: @host,
       path: @SYNCHRONIZER_URI,
       query: {
         qlookup: @keyword,
         menu: '',
         SYNCHRONIZER_TOKEN: @SYNCHRONIZER_TOKEN
       }.to_query
     )
    end

    def ingredient_url(keyword)
     url = FoodApi.query_url(keyword)
     data = Typhoeus.get(url, followlocation: true).body

     begin
        ingredient_url = 'https://ndb.nal.usda.gov' + Nokogiri::HTML(data).css('table > tbody').css('td > a').first['href']
     rescue NoMethodError
        return nil
     else
        return ingredient_url
     end
    end

    def getData(url)
     data = Nokogiri::HTML(Typhoeus.get(url, followlocation: true).body)
     ingredients = data.css('.container').last.css('.col-md-12').text

     ingredients
    end

    def retrieve_results(keyword)
     # => sort is r(relative)
     # @url = "http://api.nal.usda.gov/ndb/search/?format=json&q=#{keyword}&sort=r&max=25&offset=0&api_key=#{APIKey}"

     ingredient_url = FoodApi.ingredient_url(keyword)
     if ingredient_url != nil

        data = FoodApi.getData(ingredient_url)
        #  logger.info data
        data.gsub('Ingredients: ', '').gsub(/Date.*/, '').gsub('.', '').split(',').map(&:strip)
     else
        return []
     end
    end
  end
end
