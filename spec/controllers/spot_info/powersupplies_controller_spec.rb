require 'rails_helper'
RSpec.describe SpotInfo::PowersuppliesController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:powersupply_info)
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all spot_info_powersupplies as @spot_info_powersupplies" do
      powersupply = SpotInfo::Powersupply.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:spot_info_powersupplies)).to eq([powersupply])
    end
  end

  describe "GET #show" do
    it "assigns the requested spot_info_powersupply as @spot_info_powersupply" do
      powersupply = SpotInfo::Powersupply.create! valid_attributes
      get :show, {:id => powersupply.to_param}, valid_session
      expect(assigns(:spot_info_powersupply)).to eq(powersupply)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new spot_info_powersupply as @spot_info_powersupply" do
  #     get :new, {}, valid_session
  #     expect(assigns(:spot_info_powersupply)).to be_a_new(SpotInfo::Powersupply)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested spot_info_powersupply as @spot_info_powersupply" do
  #     powersupply = SpotInfo::Powersupply.create! valid_attributes
  #     get :edit, {:id => powersupply.to_param}, valid_session
  #     expect(assigns(:spot_info_powersupply)).to eq(powersupply)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new SpotInfo::Powersupply" do
  #       expect {
  #         post :create, {:spot_info_powersupply => valid_attributes}, valid_session
  #       }.to change(SpotInfo::Powersupply, :count).by(1)
  #     end

  #     it "assigns a newly created spot_info_powersupply as @spot_info_powersupply" do
  #       post :create, {:spot_info_powersupply => valid_attributes}, valid_session
  #       expect(assigns(:spot_info_powersupply)).to be_a(SpotInfo::Powersupply)
  #       expect(assigns(:spot_info_powersupply)).to be_persisted
  #     end

  #     it "redirects to the created spot_info_powersupply" do
  #       post :create, {:spot_info_powersupply => valid_attributes}, valid_session
  #       expect(response).to redirect_to(SpotInfo::Powersupply.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved spot_info_powersupply as @spot_info_powersupply" do
  #       post :create, {:spot_info_powersupply => invalid_attributes}, valid_session
  #       expect(assigns(:spot_info_powersupply)).to be_a_new(SpotInfo::Powersupply)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:spot_info_powersupply => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested spot_info_powersupply" do
  #       powersupply = SpotInfo::Powersupply.create! valid_attributes
  #       put :update, {:id => powersupply.to_param, :spot_info_powersupply => new_attributes}, valid_session
  #       powersupply.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested spot_info_powersupply as @spot_info_powersupply" do
  #       powersupply = SpotInfo::Powersupply.create! valid_attributes
  #       put :update, {:id => powersupply.to_param, :spot_info_powersupply => valid_attributes}, valid_session
  #       expect(assigns(:spot_info_powersupply)).to eq(powersupply)
  #     end

  #     it "redirects to the spot_info_powersupply" do
  #       powersupply = SpotInfo::Powersupply.create! valid_attributes
  #       put :update, {:id => powersupply.to_param, :spot_info_powersupply => valid_attributes}, valid_session
  #       expect(response).to redirect_to(powersupply)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the spot_info_powersupply as @spot_info_powersupply" do
  #       powersupply = SpotInfo::Powersupply.create! valid_attributes
  #       put :update, {:id => powersupply.to_param, :spot_info_powersupply => invalid_attributes}, valid_session
  #       expect(assigns(:spot_info_powersupply)).to eq(powersupply)
  #     end

  #     it "re-renders the 'edit' template" do
  #       powersupply = SpotInfo::Powersupply.create! valid_attributes
  #       put :update, {:id => powersupply.to_param, :spot_info_powersupply => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested spot_info_powersupply" do
  #     powersupply = SpotInfo::Powersupply.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => powersupply.to_param}, valid_session
  #     }.to change(SpotInfo::Powersupply, :count).by(-1)
  #   end

  #   it "redirects to the spot_info_powersupplies list" do
  #     powersupply = SpotInfo::Powersupply.create! valid_attributes
  #     delete :destroy, {:id => powersupply.to_param}, valid_session
  #     expect(response).to redirect_to(spot_info_powersupplies_url)
  #   end
  # end

end
