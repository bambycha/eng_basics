require 'rails_helper'

RSpec.describe FibsController, type: :controller do
  let(:valid_attributes) {
    { sequence_length: 10 }
  }

  let(:invalid_attributes) {
    { sequence_length: -1 }
  }

  let!(:fib) { create(:fib) }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: fib.to_param}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: fib.to_param}
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Fib" do
        expect {
          post :create, params: {fib: valid_attributes}
        }.to change(Fib, :count).by(1)
      end

      it "redirects to the created fib" do
        post :create, params: {fib: valid_attributes}
        expect(response).to redirect_to(Fib.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {fib: invalid_attributes}
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { sequence_length: 13 }
      }

      it "updates the requested fib" do
        put :update, params: {id: fib.to_param, fib: new_attributes}
        fib.reload
        expect(fib.sequence_length).to eq(13)
      end

      it "redirects to the fib" do
        put :update, params: {id: fib.to_param, fib: valid_attributes}
        expect(response).to redirect_to(fib)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: fib.to_param, fib: invalid_attributes}
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested fib" do
      expect {
        delete :destroy, params: {id: fib.to_param}
      }.to change(Fib, :count).by(-1)
    end

    it "redirects to the fibs list" do
      delete :destroy, params: {id: fib.to_param}
      expect(response).to redirect_to(fibs_url)
    end
  end

end
