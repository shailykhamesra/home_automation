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
      system "ruby /home/nrapesh/ruby/smart_home/automatic_controller.rb start"
      Control.all.each do |control|
        control.update(automated: true)
      end
      flash[:notice] = "Automatic mode on"
    else
      flash[:notice] = "Manual mode on"
      system "ruby /home/nrapesh/ruby/smart_home/automatic_controller.rb stop"
      Control.all.each do |control|
        control.update(automated: false)
      end
      flash[:notice] = "Manual mode on"
    end
    redirect_to :action => :index
  end
end
