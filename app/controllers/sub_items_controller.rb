class SubItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_sub_item, except: [:destroy]

  def destroy
    sub_item = SubItem.find(params[:id])
    sub_item.destroy
    redirect_to :back, notice: "Sub Tarefa Deletada"
  end

  def complete
    @sub_item.completed = true
    @sub_item.save
    item = Item.find(params[:item_id])

    item.sub_items.each do |s|
      if s.completed == false
        return redirect_to user_list_path(params[:user_id], params[:list_id]), notice: "Lista Atualizada!"
      end
    end

    item.completed = true
    item.save
    redirect_to user_list_path(params[:user_id], params[:list_id]), notice: "Lista Atualizada!"
  end

  def uncomplete
    @sub_item.completed = false
    @sub_item.save
    redirect_to user_list_url(params[:user_id], params[:list_id]), notice: "Lista Atualizada!"
  end

  private

  def find_sub_item
    @sub_item = SubItem.find(params[:sub_item_id])
  end
end
