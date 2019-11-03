class	ImportProcessor
  def initialize(import_id)
    @current_import = Import.find(import_id)
    @file           = @current_import.file
  end

	def import_csv
    @current_import.started_at = Time.now
    inv_users = []
    CSV.foreach(@file.path, headers: true) do |row|
      user                     = User.new(row.to_hash)
      user.import_id           = @current_import.id
      if user.valid?
        @current_import.status = 'finished'
        user.save!
      else
        inv_users << user
      end
      @current_import.inv_users = inv_users.count
      @current_import.save!
      @current_import.completed_at = Time.now
    end
  end
end