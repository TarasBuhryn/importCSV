# frozen_string_literal: true

require 'rails_helper'

feature 'Create, edit, delete import flow' do
  let!(:import)  { FactoryBot.build(:import) }

  # before do
  #   visit root_path

  #   click_on 'Create Import'    
  # end

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

  context 'update import with valid params' do
    let!(:import)  { FactoryBot.create(:import) }
    scenario 'updating a new blog' do
      visit import_path(import) 

      click_on 'Edit'

      fill_in 'Title',    with: import.title
      attach_file('File', import.file.path)

      click_on 'Create Import'

      expect(page).to have_content import.title
    end
  end

    # scenario 'delete a blog', js: true do
    #   visit blog_path(blog)

    #   expect(page).to have_content blog.title

    #   find(:css, 'i.fa.fa-trash').click

    #   visit blog_path

    #   expect(page).to have_no_content blog.title
    # end
  # end
end