class TypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.includes(:spendings).all.where(user_id: current_user.id)
  end

  def new
    @type = Type.new
  end

  def create
    type = Type.new(type_params)

    if type.save
      redirect_to root_path, notice: 'Type was successfully created!'
    else
      redirect_to new_type_path, alert: 'Type could not be created!'
    end
  end

  private

  def type_params
    params.require(:type).permit(:icon, :name, :user_id)
  end
end
