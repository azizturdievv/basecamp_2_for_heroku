class Vault < ApplicationRecord
  belongs_to :project
  has_one_attached :attachm
end
