class OrganizationsController < ApplicationController
  def index
      @Organizations = Organization.all
  end
end
