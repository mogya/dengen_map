require 'rails_helper'

RSpec.describe SpotsController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:spot)
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all spots as @spots" do
      spot = Spot.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:spots)).to eq([spot])
    end
  end

  describe "GET #show" do
    it "assigns the requested spot as @spot" do
      spot = Spot.create! valid_attributes
      get :show, {:id => spot.to_param}, valid_session
      expect(assigns(:spot)).to eq(spot)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new spot as @spot" do
  #     get :new, {}, valid_session
  #     expect(assigns(:spot)).to be_a_new(Spot)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested spot as @spot" do
  #     spot = Spot.create! valid_attributes
  #     get :edit, {:id => spot.to_param}, valid_session
  #     expect(assigns(:spot)).to eq(spot)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Spot" do
  #       expect {
  #         post :create, {:spot => valid_attributes}, valid_session
  #       }.to change(Spot, :count).by(1)
  #     end

  #     it "assigns a newly created spot as @spot" do
  #       post :create, {:spot => valid_attributes}, valid_session
  #       expect(assigns(:spot)).to be_a(Spot)
  #       expect(assigns(:spot)).to be_persisted
  #     end

  #     it "redirects to the created spot" do
  #       post :create, {:spot => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Spot.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved spot as @spot" do
  #       post :create, {:spot => invalid_attributes}, valid_session
  #       expect(assigns(:spot)).to be_a_new(Spot)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:spot => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested spot" do
  #       spot = Spot.create! valid_attributes
  #       put :update, {:id => spot.to_param, :spot => new_attributes}, valid_session
  #       spot.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested spot as @spot" do
  #       spot = Spot.create! valid_attributes
  #       put :update, {:id => spot.to_param, :spot => valid_attributes}, valid_session
  #       expect(assigns(:spot)).to eq(spot)
  #     end

  #     it "redirects to the spot" do
  #       spot = Spot.create! valid_attributes
  #       put :update, {:id => spot.to_param, :spot => valid_attributes}, valid_session
  #       expect(response).to redirect_to(spot)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the spot as @spot" do
  #       spot = Spot.create! valid_attributes
  #       put :update, {:id => spot.to_param, :spot => invalid_attributes}, valid_session
  #       expect(assigns(:spot)).to eq(spot)
  #     end

  #     it "re-renders the 'edit' template" do
  #       spot = Spot.create! valid_attributes
  #       put :update, {:id => spot.to_param, :spot => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested spot" do
  #     spot = Spot.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => spot.to_param}, valid_session
  #     }.to change(Spot, :count).by(-1)
  #   end

  #   it "redirects to the spots list" do
  #     spot = Spot.create! valid_attributes
  #     delete :destroy, {:id => spot.to_param}, valid_session
  #     expect(response).to redirect_to(spots_url)
  #   end
  # end

end
