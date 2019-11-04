# frozen_string_literal: true

require 'rails_helper'

feature 'Create, edit, delete Import flow' do
  let!(:import)  { FactoryBot.build(:import) }

  context 'create import with valid params' do
    scenario 'adding a new import' do
      visit root_path

      click_on 'Create Import'

      fill_in 'Title',    with: import.title
      attach_file('File', import.file.path)

      click_on 'Create Import'

      expect(page).to have_content import.title
    end
  end

  context 'update and delete import with valid params' do
    let!(:import) { FactoryBot.create(:import) }
    scenario 'updating a new import' do
      visit import_path(import)

      click_on 'Edit'

      fill_in 'Title',    with: import.title
      attach_file('File', import.file.path)

      click_on 'Create Import'

      expect(page).to have_content import.title
    end

    scenario 'delete import' do
      visit import_path(import)

      expect(page).to have_content import.title

      click_on 'Delete'

      expect(page).to have_no_content import.title
    end
  end
end
