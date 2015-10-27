class List < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  has_many :favoritos

  validates :title, :description, presence: true

  scope :recent, -> { order("lists.updated_at DESC") }
  scope :by_user, -> id { where(user_id: id) }
end
