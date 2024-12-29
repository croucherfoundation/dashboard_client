class Main::Page < ActiveResource::Base
  include DashboardActiveResourceConfig
  self.site                   = ENV['DASHBOARD_API_URL']
  self.prefix                 = '/api/'
  self.element_name           = "page"
  self.format                 = DashboardFormatApiResponse
  self.include_format_in_path = false

  def self.find_by_page_collection(page_collection_slug)
    response = connection.get("#{collection_path}?page_collection_slug=#{page_collection_slug}&select=all")
    parsed_response = JSON.parse(response.body)

    puts "Parsed Response: #{parsed_response.inspect}"

    pages_data = if parsed_response.is_a?(Hash) && parsed_response["data"]
                   parsed_response["data"]
                 elsif parsed_response.is_a?(Array)
                   parsed_response
                 else
                   []
                 end

    pages_data.map { |record| instantiate_record(record) }
  rescue ActiveResource::ResourceNotFound
    []
  end

end