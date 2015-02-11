namespace :search do
  desc "Uses the Search API to fetch UUIDs for Dear Lucy's in 2014"

  task get_dl_uuids: :environment do

    eds_key = ENV['FT_EDS_API_KEY']

    search_curl = %Q(curl -X POST --header "Content-Type:application/json" http://api.ft.com/content/search/v1\?apiKey\=#{eds_key} -d '{"queryString":"brand:=\\\"Dear Lucy\\\" AND initialPublishDateTime:>2014-01-01T00:00:00Z AND initialPublishDateTime:<2015-01-01T00:00:00Z", "resultContext" : { "maxResults": 5,"offset": 0 } }')

    raw_json_response = `#{search_curl}`

    apiUrls = JSON.parse(raw_json_response)["results"].flat_map { |sapi_result| sapi_result["results"].map { |search_result| search_result["apiUrl"] } }

    test_apiUrls = apiUrls.second

    content_api_url = "#{test_apiUrls}?apiKey=#{eds_key}"

    response_content = HTTParty.get(content_api_url)

    puts response_content

  end

end

