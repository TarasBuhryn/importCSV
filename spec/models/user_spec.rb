# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:import) { FactoryBot.create(:import) }
  let!(:user) { FactoryBot.build(:user, import_id: import.id) }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_length_of(:first_name).is_at_least(2) }
    it { should validate_length_of(:last_name).is_at_least(2) }
  end

  describe 'Associations' do
    it { should belong_to(:import) }
  end
end
