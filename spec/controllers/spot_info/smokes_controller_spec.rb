require 'rails_helper'

RSpec.describe SpotInfo::SmokesController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:smoke_info)
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all spot_info_smokes as @spot_info_smokes" do
      smoke = SpotInfo::Smoke.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:spot_info_smokes)).to eq([smoke])
    end
  end

  describe "GET #show" do
    it "assigns the requested spot_info_smoke as @spot_info_smoke" do
      smoke = SpotInfo::Smoke.create! valid_attributes
      get :show, {:id => smoke.to_param}, valid_session
      expect(assigns(:spot_info_smoke)).to eq(smoke)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new spot_info_smoke as @spot_info_smoke" do
  #     get :new, {}, valid_session
  #     expect(assigns(:spot_info_smoke)).to be_a_new(SpotInfo::Smoke)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested spot_info_smoke as @spot_info_smoke" do
  #     smoke = SpotInfo::Smoke.create! valid_attributes
  #     get :edit, {:id => smoke.to_param}, valid_session
  #     expect(assigns(:spot_info_smoke)).to eq(smoke)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new SpotInfo::Smoke" do
  #       expect {
  #         post :create, {:spot_info_smoke => valid_attributes}, valid_session
  #       }.to change(SpotInfo::Smoke, :count).by(1)
  #     end

  #     it "assigns a newly created spot_info_smoke as @spot_info_smoke" do
  #       post :create, {:spot_info_smoke => valid_attributes}, valid_session
  #       expect(assigns(:spot_info_smoke)).to be_a(SpotInfo::Smoke)
  #       expect(assigns(:spot_info_smoke)).to be_persisted
  #     end

  #     it "redirects to the created spot_info_smoke" do
  #       post :create, {:spot_info_smoke => valid_attributes}, valid_session
  #       expect(response).to redirect_to(SpotInfo::Smoke.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved spot_info_smoke as @spot_info_smoke" do
  #       post :create, {:spot_info_smoke => invalid_attributes}, valid_session
  #       expect(assigns(:spot_info_smoke)).to be_a_new(SpotInfo::Smoke)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:spot_info_smoke => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested spot_info_smoke" do
  #       smoke = SpotInfo::Smoke.create! valid_attributes
  #       put :update, {:id => smoke.to_param, :spot_info_smoke => new_attributes}, valid_session
  #       smoke.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested spot_info_smoke as @spot_info_smoke" do
  #       smoke = SpotInfo::Smoke.create! valid_attributes
  #       put :update, {:id => smoke.to_param, :spot_info_smoke => valid_attributes}, valid_session
  #       expect(assigns(:spot_info_smoke)).to eq(smoke)
  #     end

  #     it "redirects to the spot_info_smoke" do
  #       smoke = SpotInfo::Smoke.create! valid_attributes
  #       put :update, {:id => smoke.to_param, :spot_info_smoke => valid_attributes}, valid_session
  #       expect(response).to redirect_to(smoke)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the spot_info_smoke as @spot_info_smoke" do
  #       smoke = SpotInfo::Smoke.create! valid_attributes
  #       put :update, {:id => smoke.to_param, :spot_info_smoke => invalid_attributes}, valid_session
  #       expect(assigns(:spot_info_smoke)).to eq(smoke)
  #     end

  #     it "re-renders the 'edit' template" do
  #       smoke = SpotInfo::Smoke.create! valid_attributes
  #       put :update, {:id => smoke.to_param, :spot_info_smoke => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested spot_info_smoke" do
  #     smoke = SpotInfo::Smoke.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => smoke.to_param}, valid_session
  #     }.to change(SpotInfo::Smoke, :count).by(-1)
  #   end

  #   it "redirects to the spot_info_smokes list" do
  #     smoke = SpotInfo::Smoke.create! valid_attributes
  #     delete :destroy, {:id => smoke.to_param}, valid_session
  #     expect(response).to redirect_to(spot_info_smokes_url)
  #   end
  # end

end
