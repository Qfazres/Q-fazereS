class ItemsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_item, except: [:destroy]
  after_action :save, except: [:destroy]

  def complete
    @item.completed = true
    @item.sub_items.each do |sub_item|
      sub_item.completed = true
    end
    redirect
  end

  def uncomplete
    @item.completed = false
    @item.sub_items.each do |sub_item|
      sub_item.completed = false
    end
    redirect
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def save
    @item.save
  end

  def redirect
    redirect_to :back, notice: "Lista Atualizada!"
  end
end
