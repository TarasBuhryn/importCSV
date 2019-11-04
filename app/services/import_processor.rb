# frozen_string_literal: true

class ImportProcessor
  require 'csv'
  def initialize(id)
    @current_import = Import.find(id)
    @file           = @current_import.file
  end

  def import_csv
    @current_import.started_at   = Time.now
    inv_users                    = []
    CSV.foreach(@file.path, headers: true) do |row|
      user                     = User.new(row.to_hash)
      user.import_id           = @current_import.id
      user.valid? ? user.save! : inv_users << user
    end
    @current_import.status       = 'finished'
    @current_import.inv_users    = inv_users.count
    @current_import.completed_at = Time.now
    @current_import.save!
  end
end
