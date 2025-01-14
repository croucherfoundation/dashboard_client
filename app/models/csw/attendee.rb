class Csw::Attendee < ActiveResource::Base
  include DashboardActiveResourceConfig
  self.site                   = ENV['DASHBOARD_API_URL']
  self.prefix                 = '/api/csw/admin/'
  self.element_name           = "attendee"
  self.format                 = DashboardFormatApiResponse
  self.include_format_in_path = false

  def self.find_by_email(email)
    response = get(:search_by_email, { email: email })
    return nil if response.nil? || response.empty?
    instantiate_record(response)
  rescue ActiveResource::ResourceNotFound
    nil
  end

  def self.confirm(confirmation_token)
    response = get(:confirm, { confirmation_token: confirmation_token })
    return nil if response.nil? || response.empty?
    instantiate_record(response)
  rescue ActiveResource::ResourceNotFound
    nil
  end
end