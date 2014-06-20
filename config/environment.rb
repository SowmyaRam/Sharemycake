
# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Sharemycake::Application.initialize!

# added by R.Sowmya - Begins
# Overriding the base field_error_proc procedure.
# The base procedure treats the entries as div entries, so when error is displayed, automatically
# an additional <br> gets added, thus re-aligning the original form fields.
# this overridden procedure retains the original form design
ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| 
  "<span class='field_with_errors'>#{html_tag}</span>".html_safe
}
# added by R.Sowmya - Ends