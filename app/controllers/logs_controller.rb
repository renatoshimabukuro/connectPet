class LogsController < ApplicationController
  #All actions need users and pets
  before_action :set_user
  before_action :set_pet

  def index
    @logs = @pet.logs.order(date: :desc)
  end

  def new
    @log = @pet.logs.build
    # Send the attribute names to the form, I think?
    (1..5).each do |i|
      @log.send("attr#{i}=", @pet.send("attr#{i}"))
    end
  end

  def create
    @log = @pet.logs.build(log_params)
    if @log.save
      redirect_to user_pet_logs_path(@user, @pet), notice: "Log created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # new - To do
  #
  #create - To do
  #
  #edit - To do
  #
  #update - To do

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_pet
    @pet = @user.pets.find(params[:pet_id])
  end

  def log_params
    params.require(:log).permit(:date, :attr1_value, :attr1_memo, :attr2_value, :attr2_memo, :attr3_value, :attr3_memo, :attr4_value, :attr4_memo, :attr5_value, :attr5_memo)
  end

end
