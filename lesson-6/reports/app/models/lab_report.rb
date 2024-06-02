class LabReport < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 250 }
  validates :description, length: { maximum: 500 }
  validates :grade, inclusion: { in: %w[A B C D E FX F] }
end
