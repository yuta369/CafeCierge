class Admin::AdminsController < ApplicationController
  before_action :authenticate_admin!
  def dashboard
  end
end
