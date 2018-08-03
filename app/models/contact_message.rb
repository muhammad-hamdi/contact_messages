class ContactMessage < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 1, maximum: 255 }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 255 }
  validates :email, presence: true, length: { minimum: 1, maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Only valid emails Allowed" }
  validates :subject, presence: true, length: { minimum: 1, maximum: 255 }
  validates :description, presence: true, length: { minimum: 1, maximum: 255 }
end
