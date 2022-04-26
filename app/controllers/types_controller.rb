class TypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @types = Type.includes(:spendings).all
  end

  def new; end

  def create; end
end
