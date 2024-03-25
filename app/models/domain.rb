class Domain < ApplicationRecord
  validates :name, format: { with: /[a-z0-9]+([-.]{1}[a-z0-9]+)*\.[a-z]{2,5}/ }, uniqueness: true
  has_many :pings, dependent: :destroy
end
