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

  scenario 'update import status' do
    visit import_path(import)

    click_on 'Begin Import'

    expect(page).to have_content('Import Status: finished')
  end

  scenario 'update created users counter for import' do
    visit import_path(import)

    click_on 'Begin Import'

    expect(page).to have_content 'Created Users: 3'
  end

  scenario 'update not created users counter for import' do
    visit import_path(import)

    click_on 'Begin Import'

    expect(page).to have_content 'Not Created Users: 2'
  end
end
