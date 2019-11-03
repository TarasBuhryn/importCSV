# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :import

  validates :first_name, :last_name, :email, :date_of_birth, presence: true
  validates_format_of :email, with: %r{\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z}
  validates :first_name, :last_name, length: { minimum: 2 }
  validate :validate_age

  private

  def validate_age
    if !date_of_birth.nil?
      date_of_birth.to_date + 18.years > Date.today ||
      date_of_birth.to_date + 100.years < Date.today
    end
  end
end
