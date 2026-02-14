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

    # redirect_to clinics_path
  end

  def update
    @clinic = Clinic.find(params[:id])
    @clinic.update(clinic_params)

    # redirect_to clinics_path(@clinic)
  end

  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy

    # redirect_to clinics_path, status :see_other
  end

  private
  # def check_if_vet

  # end

  def clinic_params
    params.require(:clinic).permit.(:fields, :clinic_name, :contact, :species)
  end
end
