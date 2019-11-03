# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.build(:user) }
  let!(:attributes) { %i[first_name last_name email date_of_birth] }

  it 'has attributes' do
    expect(allergy).to respond_to(*attributes)
  end
  
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
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