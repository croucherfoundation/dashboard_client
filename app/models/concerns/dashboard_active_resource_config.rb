module DashboardActiveResourceConfig
  extend ActiveSupport::Concern

  included do
    self.site                   = ENV['DASHBOARD_API_URL']
    self.prefix                 = '/api/'
    self.format                 = DashboardFormatApiResponse
    self.include_format_in_path = false
  end
end
