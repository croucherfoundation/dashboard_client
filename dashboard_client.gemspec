require_relative 'lib/dashboard_client/version'

Gem::Specification.new do |spec|
  spec.name          = "dashboard_client"
  spec.version       = DashboardClient::VERSION
  spec.authors       = ["Thiha"]
  spec.email         = ["thiha.dve@gmail.com"]

  spec.summary          = "Holds in one place all the gubbins necessary to act as a client to the Croucher main system."
  spec.description      = "For now just a convenience and maintenance simplifier."
  spec.homepage      = "https://github.com/croucherfoundation/dashboard_client"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files=Dir["{app,config,db,lib}/**/*","MIT-LICENSE","Rakefile","README.rdoc"]

  spec.add_dependency "rails"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "request_store"
 
  spec.add_development_dependency "sqlite3"
  spec.add_dependency "activeresource"
 
end
