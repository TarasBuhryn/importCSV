# frozen_string_literal: true

class Import < ApplicationRecord
  has_many :users, dependent: :destroy

  validates_presence_of :title

  mount_uploader :file, CsvUploader
end
