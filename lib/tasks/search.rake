
namespace :search do
  desc "Uses the Search API to fetch UUIDs for Dear Lucy's in 2014"

  task get_dl_uuids: :environment do

    eds_key = ENV['FT_EDS_API_KEY']

    # test_uuid = "e20ba502-aac0-11e4-81bc-00144feab7de"

    # url_content = "http://api.ft.com/content/items/v1/#{test_uuid}?apiKey=#{eds_key}"

    # response_content = HTTParty.get(url_content)

    search_curl = %Q(curl -X POST --header "Content-Type:application/json" http://api.ft.com/content/search/v1\?apiKey\=#{eds_key} -d '{"queryString":"brand:=\\\"Dear Lucy\\\"", "resultContext" : { "maxResults": 2,"offset": 0 } }')

    puts search_curl
    json = `#{search_curl}`

    puts JSON.parse(json)["results"].flat_map { |sapi_result| sapi_result["results"].map { |search_result| search_result["apiUrl"] } }

  end

end

# require "net/http"
# require "uri"



# uri = URI.parse(url)

# # Shortcut
# response = Net::HTTP.post_form(uri, query)

# query = { 
#   "queryString" => "banks",
#   "queryContext" => {          
#      "curations" => [ "ARTICLES"]       
#   }    
# }

# query = { 
#   "queryString":(("brand:=\"Dear Lucy\"") AND (lastPublishDateTime:>2013-01-01T00:00:00Z AND lastPublishDateTime:<2014-01-01T00:00:00Z)),
#   "queryContext" : {          
#                     "curations" : ["ARTICLES"]
#     }    
# }

