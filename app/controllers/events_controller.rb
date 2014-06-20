class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :edit, :orgn_edit, :orgn_update, :orgn_percent, :orgn_percent_update, :orgn_template, :orgn_template_update, 
                                    :event_invite, :event_invite_update]
  
  def index
    @events = Event.all(:conditions => ["member_id = ?", session[:member_id]])
  end
  
  def new
    @event = Event.new
  end
  
  def edit
  end
  
  def show
  end
  
  def orgn_edit
    @Organizations = Organization.all
  end
  
  def orgn_percent
    @Organization = Organization.find(@event.orgn_id)
  end
  
  def orgn_template
  end
  
  def event_invite
    @email_message = "Hi Friends,
               It is so much fun to invite all of you to my birthday party. Save the date and please attend. Event details are furnished below."
  end
  
  def create
    @event = Event.new(event_params)
    @event.member_id = session[:member_id]
    @event.event_status = 'Pending'
    @event.event_date = Time.new(params[:event_date][:year].to_i, params[:event_date][:month].to_i, params[:event_date][:day].to_i, 
                                    params[:event_date][:hour].to_i, params[:event_date][:minute].to_i)

    respond_to do |format|
      if @event.save
        format.html { redirect_to orgn_edit_events_path(@event) }
        format.json { render action: orgn_edit_events_path, status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @event.event_date = Time.new(params[:event_date][:year].to_i, params[:event_date][:month].to_i, params[:event_date][:day].to_i, 
                                    params[:event_date][:hour].to_i, params[:event_date][:minute].to_i)
                                    
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to orgn_edit_events_path }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # This method is being used to update the organization id that has been selected for an event.
  # In case no value gets selected, an error message will be flashed on screen.
  def orgn_update
    @event.orgn_id = params[:orgn_id]

    if !params[:orgn_id]
      redirect_to orgn_edit_events_path, :flash => { :error => 'Select an Organization for this event.' }
      #flash[:alert] = 'Select an Organization for this event.'
      #render :action => :orgn_edit
      return
    end
    
    respond_to do |format|
      if @event.update(orgn_params)
        format.html { redirect_to orgn_percent_events_path }
        format.json { head :no_content }
      else
        format.html { redirect_to orgn_percent_events_path }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # This method will update the contribution percent the user decides to indicate for the selected organization.
  # In case no value is entered, or the entry is not a number between 1 and 100, error will be flashed on screen.
  def orgn_percent_update
    @event.contr_percent = params[:event][:contr_percent]

    if (!@event.contr_percent) or (!@event.contr_percent.is_a? Numeric) or (!@event.contr_percent.between?(1, 100))
      # Redirect used in this situation as the value for Organization title needs to be re-fetched into the screen.
      # render does not populate the values, results in error.
      redirect_to orgn_percent_events_path, :flash => { :error => 'Enter a positive numeric value in the range 1..100'}
      @event.contr_percent = nil
      #flash[:alert] = 'Enter a positive numeric value in the range 1..100'
      #render :action => :orgn_percent
      return
    end

    respond_to do |format|
      if @event.update(percent_params)
        format.html { redirect_to orgn_template_events_path }
        format.json { head :no_content }
      else
        format.html { redirect_to orgn_template_events_path }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # This method updates the template id selected for the event. Template id's are internally assigned integer values starting
  # from 1 and the same value will get stored upon submit.
  def orgn_template_update
    @event.template_id = params[:template_id]

    if !params[:template_id]
      #redirect_to orgn_template_events_path, :flash => { :error => 'Select a template.' }
      flash[:alert] = 'Select a template.'
      render :action => :orgn_template
      return
    end
    
    @event.template_id = @event.template_id
    
    respond_to do |format|
      if @event.update(template_params)
        format.html { redirect_to event_invite_events_path }
        format.json { head :no_content }
      else
        format.html { redirect_to event_invite_events_path }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def event_invite_update
    @event.email_id = params[:event]["email_id"]
    @event.email_message = params[:event]["email_message"]
    @event.event_status = 'Invited'

    if ((@event.email_id).empty? or (@event.email_message).empty?)
      redirect_to event_invite_events_path, :flash => { :error => 'Enter a message and include one or more email ids.' }
      #flash[:alert] =  'Enter a message and include one or more email ids.'
      #render :action => :event_invite
      return
    end
    
    respond_to do |format|
      if @event.update(email_params)
        # Commented by R.Sowmya - tested the email feature on the development environment.
        #InviteMailer.send_invite(@event).deliver
        format.html { redirect_to event_invite_events_path  }
        format.json { head :no_content }
      else
        format.html { redirect_to event_invite_events_path }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  
  private
  
  def set_event
    @event = Event.find(params[:id], :conditions => ["member_id = ?", session[:member_id]])
  end
  
  def orgn_params
    params.require(:event).permit(:orgn_id) if params[:event]      
  end
  
  def percent_params
    params.require(:event).permit(:contr_percent) if params[:event]
  end

  def template_params
    params.require(:event).permit(:template_id) if params[:event]
  end
  
  def email_params
    params.require(:event).permit(:email_id, :email_message) if params[:event]
  end
  
  def event_params
    params.require(:event).permit(:event_name, :event_date, :venue, :event_desc) if params[:event]
  end
  
end
