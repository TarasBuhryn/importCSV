# frozen_string_literal: true

class StartImportJob < ApplicationJob
  queue_as :default

  def perform(id)
    ImportProcessor.new(id).import_csv
  end
end
