class ManualController < ApplicationController

  before_action :confirm_logged_in

  layout "manual"

  def index
    @controls = Control.all
  end

  def toggle
    @control = Control.find(params[:id])
    @control.toggle :automated
    @control.save
    if @control.automated
      flash[:notice] = "#{@control.name} is turned on"
    else
      flash[:notice] = "#{@control.name} is turned off"
    end
    redirect_to :action => :index
  end
end
