class SpendingsController < ApplicationController
  before_action :authenticate_user!

  def index
    unless current_user.types.where(id: params[:type_id]).present?
      redirect_to root_path,
                  alert: 'You cant access that page'
    end
    @spendings = Spending.includes(:type).where(type_id: params[:type_id]).order(created_at: :desc)
  end

  def new
    @spending = Spending.new
    @types = Type.all.where(user_id: current_user.id)
  end

  def create
    spending = Spending.new(spending_params)

    if spending.save
      redirect_to type_spendings_path(type_id: spending_params[:type_id]), notice: 'Spending was successfully created.'
    else
      redirect_to new_type_spending_path, alert: 'Spending was not created!'
    end
  end

  private

  def spending_params
    params.require(:spending).permit(:author_id, :name, :amount, :type_id)
  end
end
