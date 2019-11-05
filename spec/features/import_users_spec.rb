# frozen_string_literal: true

require 'rails_helper'

context 'Create users for Import' do
  let!(:import) { FactoryBot.create(:import) }

  scenario 'create users for import' do
    visit import_path(import)

    click_on 'Begin Import'

    expect(page).to have_content import.title

    click_on 'Users'

    expect(page).to have_content 'Users'
  end

  scenario 'update user status and user counters for import' do
    visit import_path(import)

    click_on 'Begin Import'

    expect(page).to have_content('Import Status: finished')
    expect(page).to have_no_content 'Created Users: 0' && 'Not Created Users: 0'
  end
end
