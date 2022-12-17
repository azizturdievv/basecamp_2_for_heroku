class Project < ApplicationRecord
  belongs_to :user
  has_many :message_boards, dependent: :destroy
  has_many :todosets, dependent: :destroy
  has_many :vaults, dependent: :destroy
end
