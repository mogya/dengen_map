require 'rails_helper'

RSpec.describe Tag::WifisController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:tag_wifi1)
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tag_wifis as @tag_wifis" do
      wifi = Tag::Wifi.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tag_wifis)).to eq([wifi])
    end
  end

  describe "GET #show" do
    it "assigns the requested tag_wifi as @tag_wifi" do
      wifi = Tag::Wifi.create! valid_attributes
      get :show, {:id => wifi.to_param}, valid_session
      expect(assigns(:tag_wifi)).to eq(wifi)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new tag_wifi as @tag_wifi" do
  #     get :new, {}, valid_session
  #     expect(assigns(:tag_wifi)).to be_a_new(Tag::Wifi)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested tag_wifi as @tag_wifi" do
  #     wifi = Tag::Wifi.create! valid_attributes
  #     get :edit, {:id => wifi.to_param}, valid_session
  #     expect(assigns(:tag_wifi)).to eq(wifi)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Tag::Wifi" do
  #       expect {
  #         post :create, {:tag_wifi => valid_attributes}, valid_session
  #       }.to change(Tag::Wifi, :count).by(1)
  #     end

  #     it "assigns a newly created tag_wifi as @tag_wifi" do
  #       post :create, {:tag_wifi => valid_attributes}, valid_session
  #       expect(assigns(:tag_wifi)).to be_a(Tag::Wifi)
  #       expect(assigns(:tag_wifi)).to be_persisted
  #     end

  #     it "redirects to the created tag_wifi" do
  #       post :create, {:tag_wifi => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Tag::Wifi.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved tag_wifi as @tag_wifi" do
  #       post :create, {:tag_wifi => invalid_attributes}, valid_session
  #       expect(assigns(:tag_wifi)).to be_a_new(Tag::Wifi)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:tag_wifi => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested tag_wifi" do
  #       wifi = Tag::Wifi.create! valid_attributes
  #       put :update, {:id => wifi.to_param, :tag_wifi => new_attributes}, valid_session
  #       wifi.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested tag_wifi as @tag_wifi" do
  #       wifi = Tag::Wifi.create! valid_attributes
  #       put :update, {:id => wifi.to_param, :tag_wifi => valid_attributes}, valid_session
  #       expect(assigns(:tag_wifi)).to eq(wifi)
  #     end

  #     it "redirects to the tag_wifi" do
  #       wifi = Tag::Wifi.create! valid_attributes
  #       put :update, {:id => wifi.to_param, :tag_wifi => valid_attributes}, valid_session
  #       expect(response).to redirect_to(wifi)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the tag_wifi as @tag_wifi" do
  #       wifi = Tag::Wifi.create! valid_attributes
  #       put :update, {:id => wifi.to_param, :tag_wifi => invalid_attributes}, valid_session
  #       expect(assigns(:tag_wifi)).to eq(wifi)
  #     end

  #     it "re-renders the 'edit' template" do
  #       wifi = Tag::Wifi.create! valid_attributes
  #       put :update, {:id => wifi.to_param, :tag_wifi => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested tag_wifi" do
  #     wifi = Tag::Wifi.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => wifi.to_param}, valid_session
  #     }.to change(Tag::Wifi, :count).by(-1)
  #   end

  #   it "redirects to the tag_wifis list" do
  #     wifi = Tag::Wifi.create! valid_attributes
  #     delete :destroy, {:id => wifi.to_param}, valid_session
  #     expect(response).to redirect_to(tag_wifis_url)
  #   end
  # end

end
