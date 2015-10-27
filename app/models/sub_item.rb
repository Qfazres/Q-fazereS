class SubItem < ActiveRecord::Base
  belongs_to :item

  validates :description, presence: true
end
