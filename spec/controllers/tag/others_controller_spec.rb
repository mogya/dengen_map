require 'rails_helper'

RSpec.describe Tag::OthersController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:tag_other1)
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tag_others as @tag_others" do
      other = Tag::Other.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tag_others)).to eq([other])
    end
  end

  describe "GET #show" do
    it "assigns the requested tag_other as @tag_other" do
      other = Tag::Other.create! valid_attributes
      get :show, {:id => other.to_param}, valid_session
      expect(assigns(:tag_other)).to eq(other)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new tag_other as @tag_other" do
  #     get :new, {}, valid_session
  #     expect(assigns(:tag_other)).to be_a_new(Tag::Other)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested tag_other as @tag_other" do
  #     other = Tag::Other.create! valid_attributes
  #     get :edit, {:id => other.to_param}, valid_session
  #     expect(assigns(:tag_other)).to eq(other)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Tag::Other" do
  #       expect {
  #         post :create, {:tag_other => valid_attributes}, valid_session
  #       }.to change(Tag::Other, :count).by(1)
  #     end

  #     it "assigns a newly created tag_other as @tag_other" do
  #       post :create, {:tag_other => valid_attributes}, valid_session
  #       expect(assigns(:tag_other)).to be_a(Tag::Other)
  #       expect(assigns(:tag_other)).to be_persisted
  #     end

  #     it "redirects to the created tag_other" do
  #       post :create, {:tag_other => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Tag::Other.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved tag_other as @tag_other" do
  #       post :create, {:tag_other => invalid_attributes}, valid_session
  #       expect(assigns(:tag_other)).to be_a_new(Tag::Other)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:tag_other => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested tag_other" do
  #       other = Tag::Other.create! valid_attributes
  #       put :update, {:id => other.to_param, :tag_other => new_attributes}, valid_session
  #       other.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested tag_other as @tag_other" do
  #       other = Tag::Other.create! valid_attributes
  #       put :update, {:id => other.to_param, :tag_other => valid_attributes}, valid_session
  #       expect(assigns(:tag_other)).to eq(other)
  #     end

  #     it "redirects to the tag_other" do
  #       other = Tag::Other.create! valid_attributes
  #       put :update, {:id => other.to_param, :tag_other => valid_attributes}, valid_session
  #       expect(response).to redirect_to(other)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the tag_other as @tag_other" do
  #       other = Tag::Other.create! valid_attributes
  #       put :update, {:id => other.to_param, :tag_other => invalid_attributes}, valid_session
  #       expect(assigns(:tag_other)).to eq(other)
  #     end

  #     it "re-renders the 'edit' template" do
  #       other = Tag::Other.create! valid_attributes
  #       put :update, {:id => other.to_param, :tag_other => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested tag_other" do
  #     other = Tag::Other.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => other.to_param}, valid_session
  #     }.to change(Tag::Other, :count).by(-1)
  #   end

  #   it "redirects to the tag_others list" do
  #     other = Tag::Other.create! valid_attributes
  #     delete :destroy, {:id => other.to_param}, valid_session
  #     expect(response).to redirect_to(tag_others_url)
  #   end
  # end

end
