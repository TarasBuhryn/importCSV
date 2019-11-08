# frozen_string_literal: true

require 'rails_helper'

describe ImportProcessor do
  let(:import) { FactoryBot.create(:import) }
  let(:import_processor) { ImportProcessor.new(import.id) }

  context 'Process of import' do
    before(:each) do
      import_processor.import_csv
    end

    it 'Create valid users for import' do
      updated_import = Import.find(import.id)
      user_count     = updated_import.users.count
      expect(updated_import.users.count).to eq(user_count)
    end

    it 'Count invalid users' do
      updated_import = Import.find(import.id)
      invalid_users  = updated_import.inv_users
      expect(updated_import.inv_users).to eq(invalid_users)
    end

    it 'Update import status to' do
      updated_import = Import.find(import.id)
      expect(updated_import.status).to match(%r{finished})
    end

    it 'Create started at time' do
      updated_import = Import.find(import.id)
      time_started   = updated_import.started_at
      expect(updated_import.started_at).to eq(time_started)
    end

    it 'Create completed at time' do
      updated_import = Import.find(import.id)
      time_completed = updated_import.completed_at
      expect(updated_import.completed_at).to eq(time_completed)
    end
  end
end
