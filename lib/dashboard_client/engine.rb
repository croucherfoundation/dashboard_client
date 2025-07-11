require_relative "../../app/helpers/search_client_helper"

module DashboardClient
  class Engine < ::Rails::Engine

    initializer "dashboard_client.integration" do
      ActiveSupport.on_load :action_controller do
        helper ::DashboardClientHelper
      end
    end

  end
end
