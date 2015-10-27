class ListsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user
  before_action :find_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.by_user(current_user.id).recent
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    @list.user_id = @user.id

    if @list.save
      redirect_to user_lists_path(@user, @list), notice: "Lista Criada!"
    else
      redirect_to new_user_list_path(@user, @list), alert: "Erro ao Criar Lista!"
    end
  end

  def show

  end

  def edit

  end

  def update
    if @list.update(list_params)
      redirect_to edit_user_list_path(@user, @list), notice: "Lista Atualizada!"
    else
      redirect_to edit_user_list_path(@user, @list), alert: "Erro ao Atualizar a Lista!"
    end
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path(@user), notice: "Lista Deletada!"
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :public, :item, items_attributes: [:description, :id, sub_items_attributes: [:description]])
  end

  def find_list
    @list = List.includes(:items).includes(items:[:sub_items]).find(params[:id])
  end

  def find_user
    @user = User.find(current_user.id) if current_user != nil
  end
end
