class SessionsController < ApplicationController
  def new
  end

  def create
    member = Member.find_by(email: params[:email])
    if member and member.authenticate(params[:password])
        session[:member_id] = member.id
        redirect_to host_invitee_index_path
    else
      redirect_to login_url, alert: "Invalid user/password combination" 
    end
  end

  def destroy
    session[:member_id] = nil
    session[:current_user] = nil
    reset_session
    redirect_to home_index_path, notice: "Logged out"
  end
end
