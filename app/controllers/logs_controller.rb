class LogsController < ApplicationController
  require "csv"
  #All actions need users and pets
  before_action :set_user
  before_action :set_pet

  def index
    @logs = @pet.logs.order(date: :desc)
  end

  def new
    @log = @pet.logs.build
  end

  def create
    @log = @pet.logs.build(log_params)
    if @log.save
      redirect_to user_pet_logs_path(@user, @pet), notice: "Log created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def export
    @logs = @pet.logs
    start_date = params[:start_date]
    end_date   = params[:end_date]
    # set start and end date params in view
    # get all logs in this range.
    @logs.where(date:start_date..end_date)

    # create csv file
    CSV.open("#{@pet.name}Log#{params[:start_date]}To#{params[:end_date]}", "wb") do |csv|
      header = ["Date"]
      (1..5).each do |num|
        attr_name = @pet.send("attr#{num}")
        if attr_name.present?
          header += [attr_name, "#{attr_name} Value", "#{attr_name} Memo"]
        end
      end
      # add complete header
      csv << header

      # itterate over the logs for each csv row
      @logs.each do |log|
        row = [log.date]
        (1..5).each do |num|

          if @pet.send("attr#{num}").present?
            val_name = log.send("attr#{num}")
            val_score = log.send("attr#{num}_value")
            val_memo = log.send("attr#{num}_memo")
            row += [val_name, val_score, val_memo]
          end
        end
        csv << row
      end
    end
  end

  def show
    set_log
  end
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

  def set_log
    @log = @pet.logs.find(params[:id])
  end

  def log_params
    params.require(:log).permit(:date,
      :attr1, :attr1_value, :attr1_memo,
      :attr2, :attr2_value, :attr2_memo,
      :attr3, :attr3_value, :attr3_memo,
      :attr4, :attr4_value, :attr4_memo,
      :attr5, :attr5_value, :attr5_memo)
  end
end
