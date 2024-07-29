class Admin::CafesController < ApplicationController
  before_action :authenticate_admin!
  def index
  end
end
