class HomeController < ApplicationController

  before_action :confirm_logged_in

  layout "home"

  def index
    @main_switch = MainSwitch.first
    if !@main_switch
       redirect_to new_main_switch_path
    end
  end

  def edit
    @switch = MainSwitch.find(params[:id])
    @switch.toggle :control
    @switch.save
    if @switch.control
      system I18n.t 'path_start'
      Control.all.each do |control|
        control.update(automated: true)
      end
      flash[:notice] = I18n.t 'mode.automatic'
    else
      system I18n.t 'path_stop'
      Control.all.each do |control|
        control.update(automated: false)
      end
      flash[:notice] = I18n.t 'mode.manual'
    end
    redirect_to :action => :index
  end
end
