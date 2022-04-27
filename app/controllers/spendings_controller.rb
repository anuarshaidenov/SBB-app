class SpendingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @spendings = Type.includes(:spendings).find(params[:type_id]).spendings
  end

  def new; end

  def create; end
end
