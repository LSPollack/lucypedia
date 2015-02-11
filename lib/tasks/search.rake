namespace :search do
  desc "Uses the Search API to fetch UUIDs for Dear Lucy's in 2014"

  task get_dl_uuids: :environment do

    eds_key = ENV['FT_EDS_API_KEY']
    max_search_results = 10

    search_curl = %Q(curl -X POST --header "Content-Type:application/json" http://api.ft.com/content/search/v1\?apiKey\=#{eds_key} -d '{"queryString":"brand:=\\\"Dear Lucy\\\" AND initialPublishDateTime:>2014-01-01T00:00:00Z AND initialPublishDateTime:<2015-01-01T00:00:00Z", "resultContext" : { "maxResults": #{max_search_results},"offset": 0 } }')

    raw_json_response = `#{search_curl}`

    apiUrls = JSON.parse(raw_json_response)["results"].flat_map { |sapi_result| sapi_result["results"].map { |search_result| search_result["apiUrl"] } }
    
    # It appears that sometimes the SAPI returns nil (or at least it does when the result is parsed in this way). Would be worth investigating.
    apiUrls.compact!
    puts apiUrls.count

    apiUrls.each do |capi_url| 
      full_capi_url = "#{capi_url}?apiKey=#{eds_key}" 
      raw_response_content = HTTParty.get(full_capi_url)
      response_content_title = raw_response_content["item"]["title"]["title"]
      response_content_raw_html_bodycopy = raw_response_content["item"]["body"]["body"]
      response_content_raw_intialpubdatetime = raw_response_content["item"]["lifecycle"]["initialPublishDateTime"]
      response_content_link_to_story = raw_response_content["item"]["location"]["uri"]
    end

  end

end

