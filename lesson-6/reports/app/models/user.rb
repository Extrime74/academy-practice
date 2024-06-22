class User < ApplicationRecord
  has_many :lab_reports, dependent: :destroy
  validates :email, presence: true, length: { maximum: 150 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 100 }
end
