class Csw::Newsletter < ActiveResource::Base
  include DashboardActiveResourceConfig
  self.site                   = ENV['DASHBOARD_API_URL']
  self.prefix                 = '/api/csw/admin/'
  self.element_name           = "newsletter"
  self.format                 = DashboardFormatApiResponse
  self.include_format_in_path = false

end