class ControlsController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_control, only: [:show, :edit, :update, :destroy]
  before_action :load_pins, only: [:new, :create, :edit, :update]

  def index
    @controls = Control.all
  end

  def show
  end

  def new
    @control = Control.new
  end

  def edit
  end

  def create
    @control = Control.new(control_params)

    respond_to do |format|
      if @control.save
        format.html { redirect_to @control, notice: 'Control was successfully created.' }
        format.json { render :show, status: :created, location: @control }
      else
        format.html { render :new }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @control.update(control_params)
        format.html { redirect_to @control, notice: 'Control was successfully updated.' }
        format.json { render :show, status: :ok, location: @control }
      else
        format.html { render :edit }
        format.json { render json: @control.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @control.destroy
    respond_to do |format|
      format.html { redirect_to controls_url, notice: 'Control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_control
      @control = Control.find(params[:id])
    end

    def control_params
      params.require(:control).permit(:name, :pin, :configure, :configureoff, :automated)
    end

    def load_pins
        objects = Control.all
        pins = [ 4, 5, 6, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27 ]
        existing_pins = []
        if objects
          for obj in objects
            existing_pins.push(obj.pin)
          end
        end
        @pins = (pins - existing_pins)
        if params[:action] == 'edit' || params[:action] == 'update'
          controller = Control.find(params[:id])
          @pins.push(controller.pin)
        end
        @pins = @pins.sort
    end

end
