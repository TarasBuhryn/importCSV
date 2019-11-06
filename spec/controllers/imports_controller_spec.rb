# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportsController, type: :controller do
  describe 'Imports controller request specs' do
    context 'GET #index' do
      it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
      end
    end

    context 'GET #show' do
      let!(:import) { FactoryBot.create(:import) }

      it 'should success and render to show page' do
        get :show, params: { id: import.id }
        expect(response).to have_http_status(200)
        expect(response).to render_template :show
      end
    end

    context 'POST #create' do
      let!(:import) { FactoryBot.create(:import) }

      it 'create a new import' do
        params = {
          title: 'An awesome import'
        }
        expect { post(:create, params: { import: params }) }.to change(Import, :count).by(1)
        expect(flash[:notice]).to eq 'New import added!'
      end
    end

    context 'PUT #update' do
      let!(:import) { FactoryBot.create(:import) }

      it 'should update import info' do
        params = {
          title: 'Awesome import'
        }

        put :update, params: { id: import.id, import: params }
        import.reload
        params.keys.each do |key|
          expect(import.attributes[key.to_s]).to eq params[key]
        end
      end
    end

    context 'DELETE #destroy' do
      let!(:import) { FactoryBot.create(:import) }

      it 'should delete import' do
        expect { delete :destroy, params: { id: import.id } }.to change(Import, :count).by(-1)
        expect(flash[:notice]).to eq 'Import deleted!'
      end
    end

    context 'GET #users' do
      let(:import) { FactoryBot.create(:import) }

      it 'should success and render to users page' do
        get :users, params: { id: import.id }
        expect(response).to have_http_status(200)
        expect(response).to render_template :users
      end
    end

    context ' POST #start_import' do
      let(:import) { FactoryBot.create(:import) }

      it 'redirects to the start_import path' do
        post :start_import, params: { id: import.id }
        expect(response).to redirect_to(start_import_import_path(import))
      end
    end
  end
end
