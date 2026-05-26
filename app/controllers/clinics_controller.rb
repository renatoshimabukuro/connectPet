class ClinicsController < ApplicationController

  def index
    if params[:query].present?
      @clinics = Clinic.search_by_clinic(params[:query])
    else
      @clinics = Clinic.all
    end
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
    if current_user.clinic.present?
      redirect_to chats_path, alert: "You already have a clinic"
      return
    end

    @clinic = current_user.build_clinic(clinic_params)

      if @clinic.save
        redirect_to chats_path, notice: "Clinic was registered successfully"
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
