class Csw::Event < ActiveResource::Base
  include DashboardActiveResourceConfig
  self.site                   = ENV['DASHBOARD_API_URL']
  self.prefix                 = '/api/csw/admin/'
  self.element_name           = "event_pages"
  self.format                 = DashboardFormatApiResponse
  self.include_format_in_path = false

  class << self
    def contract_event(attributes)
      raise ArgumentError, "Attributes must include :contract_id" unless attributes[:contract_id]

      post(:contract_event, {event: attributes})
    rescue ActiveResource::ResourceNotFound => e
      Rails.logger.error("Contract event not found: #{e.message}")
      nil
    rescue ActiveResource::ServerError => e
      Rails.logger.error("Server error while creating contract event: #{e.message}")
      nil
    end
  end
end
