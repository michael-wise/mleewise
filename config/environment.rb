# Load the Rails application.
require_relative 'application'
app_environment_variables = File.join(Rails.root, 'config', 'environment_variables.rb')
if File.exists?(app_environment_variables) 
	load(app_environment_variables) 
else 
	puts "please set ENV['eventbritePersonal']='your api key' in config/environment_variables.rb"
end
# Initialize the Rails application.
Rails.application.initialize!
