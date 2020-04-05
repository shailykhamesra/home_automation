class MainSwitchesController < ApplicationController
  before_action :set_main_switch, only: [:show, :edit, :update, :destroy]
  before_action :confirm_logged_in
  
  layout "switch"

  def index
    @main_switches = MainSwitch.all
  end

  def show
  end

  def new
    @main_switch = MainSwitch.new
  end

  def edit
  end

  def create
    @main_switch = MainSwitch.new(main_switch_params)
    respond_to do |format|
      if @main_switch.save
        reset_services
        format.html { redirect_to home_index_path, notice: "#{I18n.t 'main_switch.action'} created." }
        format.json { render :show, status: :created, location: @main_switch }
      else
        format.html { render :new }
        format.json { render json: @main_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @main_switch.update(main_switch_params)
        reset_services
        format.html { redirect_to @main_switch, notice: "#{I18n.t 'main_switch.action'} updated." }
        format.json { render :show, status: :ok, location: @main_switch }
      else
        format.html { render :edit }
        format.json { render json: @main_switch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @main_switch.destroy
    respond_to do |format|
      format.html { redirect_to main_switches_url, notice: "#{I18n.t 'main_switch.action'} destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_main_switch
      @main_switch = MainSwitch.find(params[:id])
    end

    def main_switch_params
      params.require(:main_switch).permit(:control)
    end

    def reset_services
      if @main_switch.control
        system I18n.t 'path_start'
      else
        system I18n.t 'path_stop'
      end
    end
end
