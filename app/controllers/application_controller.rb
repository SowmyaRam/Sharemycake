class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

    def current_user
      @current_user ||= Member.find(session[:member_id]).first_name if session[:member_id]
    end
    
    # Method added by R.Sowmya to check if an event already exists for the logged in member_id.
    # If at least one event has been generated, enable "Edit Event" link as part of the menu.n
    def event_exist
      @member_id = Member.find(session[:member_id]).id if session[:member_id]
      @event_id = Event.find(:first, :conditions => ["member_id = ?", @member_id] )
    end

    helper_method :current_user, :event_exist
    
end
