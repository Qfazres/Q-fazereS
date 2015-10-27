class HomeController < ApplicationController

  before_action :find_user
  before_action :authenticate_user!, only: [:publica]

  def index

  end

  def publica
    @lists = List.where(public: true).where("user_id != ?", current_user)
  end

  private

  def find_user
    @user = User.find(current_user.id) if current_user != nil
  end
end
