require 'rails_helper'

describe ImportProcessor do
  
  # context "#initialize" do
  #   let(:import) { FactoryBot.create(:import) }

  #   it " defines values"      
  #     allow(@current_import).to eq(Import.find(id))
  #     allow(@file).to eq(@current_import.file)
  #     expect(@current_import).to eq(import)
  #     expect(@file).to eq(import.file)
  #   end
  context "#import_csv" do
    let(:import) { FactoryBot.create(:import) }

    it "creates users for import from file" do
      # import_process = double('import_process')
      # @current_import = ImportProcessor.new(import.id)
      # @file           = @current_import.file
      # allow(@current_import).to receive(:import_csv)
      allow(ImportProcessor).to receive(:new).with(import.id.to_s).and_return(
        import_process = double
        )
      allow(import_process).to receive(:initialize).with(import.id).and_return(
        current_import = double
        )
      expect(current_import).to receive (:import_csv)
    end
  end
end