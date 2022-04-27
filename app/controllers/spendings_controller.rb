class SpendingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @spendings = Type.includes(:spendings).find(params[:type_id]).spendings
  end

  def new
    @spending = Spending.new
    @types = Type.all
  end

  def create
    spending = Spending.new(spending_params)

    if spending.save
      redirect_to root_path, notice: 'Spending was successfully created.'
    else
      redirect_to new_type_spending_path, alert: 'Spending was not created!'
    end
  end

  private

  def spending_params
    params.require(:spending).permit(:author_id, :name, :amount, :type_id)
  end
end
