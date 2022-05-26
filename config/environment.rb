# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# To disable form inputs with the html class of 'fields_with_errors'. This class appears everytime we have errors in our inputs and Rails added automatically.
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end

DISABLE_DATABASE_ENVIRONMENT_CHECK=1