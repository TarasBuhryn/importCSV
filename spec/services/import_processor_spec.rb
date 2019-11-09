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
      expect(updated_import.users.count).to eq(3)
    end

    it 'Count invalid users' do
      updated_import = Import.find(import.id)
      expect(updated_import.inv_users).to eq(2)
    end

    it 'Update import status to' do
      updated_import = Import.find(import.id)
      expect(updated_import.status).to match(%r{finished})
    end

    it 'Create started at time' do
      updated_import = Import.find(import.id)
      expect(updated_import.started_at).not_to be_nil
    end

    it 'Create completed at time' do
      updated_import = Import.find(import.id)
      expect(updated_import.completed_at).not_to be_nil
    end
  end
end
