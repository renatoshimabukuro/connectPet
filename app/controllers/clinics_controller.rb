class ClinicsController < ApplicationController

  def index
    @clinics = Clinic.all
  end

  def show
    @clinic = Clinic.find(params[:id])
  end

  def new
    @clinic = Clinic.new
  end

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def create
      @clinic = Clinic.new(clinic_params)
      @clinic.save

      if @clinic.save
        redirect_to @clinic, notice: "Clinic was registered successfully"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      redirect_to @clinic, notice: "Clinic was updated"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy
  end

  private

  def clinic_params
    params.require(:clinic).permit.(:fields, :clinic_name, :contact, :species)
  end
end
