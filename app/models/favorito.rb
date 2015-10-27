class Favorito < ActiveRecord::Base
  belongs_to :list
  validates :list, presence: true

  belongs_to :user
  validates :user, presence: true

  scope :recent, -> { order("lists.updated_at DESC") }
end
