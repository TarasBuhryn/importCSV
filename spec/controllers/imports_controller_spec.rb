# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportsController, type: :controller do
  describe '#start_import' do
    let(:import) { FactoryBot.create(:import) }

    it 'creates a new users in current import' do
      expect(ImportProcessor).to receive(:new).with(import.id.to_s).and_return(
        import_process = double
      )
      expect(import_process).to receive(:import_csv)
      post :start_import, params: { id: import.id }
      expect(subject).to redirect_to(start_import_import_path(import))
    end
  end

  describe '#users' do
    let(:import) { FactoryBot.create(:import) }

    it 'shows users of current import' do
      get :users, params: { id: import.id }
      expect(response.status).to eq(200)
    end
  end
end
