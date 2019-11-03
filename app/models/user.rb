# frozen_string_literal: true

class User < ApplicationRecord
  require 'csv'

  belongs_to :import

  validates :first_name, :last_name, :email, :date_of_birth, presence: true
  validates_format_of :email, with: %r{\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z}
  validates :first_name, :last_name, length: { minimum: 2 }
  validate :validate_age

  def self.import(file, current_import)
    current_import.started_at = Time.now
    inv_users = []
    CSV.foreach(file.path, headers: true) do |row|
      user                     = User.new(row.to_hash)
      user.import_id           = current_import.id
      if user.valid?
        current_import.status = 'finished'
        user.save!
      else
        inv_users << user
      end
      current_import.inv_users = inv_users.count
      current_import.save!
      current_import.completed_at = Time.now
    end
  end

  private

  def validate_age
    if !date_of_birth.nil?
      date_of_birth.to_date + 18.years > Date.today ||
        date_of_birth.to_date + 100.years < Date.today
    else
      errors.add(:date_of_birth, 'You should be over 18 years old.')
    end
  end
end
