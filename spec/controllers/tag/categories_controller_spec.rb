require 'rails_helper'

RSpec.describe Tag::CategoriesController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:tag_category1)
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tag_categories as @tag_categories" do
      category = Tag::Category.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:tag_categories)).to eq([category])
    end
  end

  describe "GET #show" do
    it "assigns the requested tag_category as @tag_category" do
      category = Tag::Category.create! valid_attributes
      get :show, {:id => category.to_param}, valid_session
      expect(assigns(:tag_category)).to eq(category)
    end
  end

  # describe "GET #new" do
  #   it "assigns a new tag_category as @tag_category" do
  #     get :new, {}, valid_session
  #     expect(assigns(:tag_category)).to be_a_new(Tag::Category)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested tag_category as @tag_category" do
  #     category = Tag::Category.create! valid_attributes
  #     get :edit, {:id => category.to_param}, valid_session
  #     expect(assigns(:tag_category)).to eq(category)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Tag::Category" do
  #       expect {
  #         post :create, {:tag_category => valid_attributes}, valid_session
  #       }.to change(Tag::Category, :count).by(1)
  #     end

  #     it "assigns a newly created tag_category as @tag_category" do
  #       post :create, {:tag_category => valid_attributes}, valid_session
  #       expect(assigns(:tag_category)).to be_a(Tag::Category)
  #       expect(assigns(:tag_category)).to be_persisted
  #     end

  #     it "redirects to the created tag_category" do
  #       post :create, {:tag_category => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Tag::Category.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved tag_category as @tag_category" do
  #       post :create, {:tag_category => invalid_attributes}, valid_session
  #       expect(assigns(:tag_category)).to be_a_new(Tag::Category)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:tag_category => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested tag_category" do
  #       category = Tag::Category.create! valid_attributes
  #       put :update, {:id => category.to_param, :tag_category => new_attributes}, valid_session
  #       category.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested tag_category as @tag_category" do
  #       category = Tag::Category.create! valid_attributes
  #       put :update, {:id => category.to_param, :tag_category => valid_attributes}, valid_session
  #       expect(assigns(:tag_category)).to eq(category)
  #     end

  #     it "redirects to the tag_category" do
  #       category = Tag::Category.create! valid_attributes
  #       put :update, {:id => category.to_param, :tag_category => valid_attributes}, valid_session
  #       expect(response).to redirect_to(category)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the tag_category as @tag_category" do
  #       category = Tag::Category.create! valid_attributes
  #       put :update, {:id => category.to_param, :tag_category => invalid_attributes}, valid_session
  #       expect(assigns(:tag_category)).to eq(category)
  #     end

  #     it "re-renders the 'edit' template" do
  #       category = Tag::Category.create! valid_attributes
  #       put :update, {:id => category.to_param, :tag_category => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested tag_category" do
  #     category = Tag::Category.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => category.to_param}, valid_session
  #     }.to change(Tag::Category, :count).by(-1)
  #   end

  #   it "redirects to the tag_categories list" do
  #     category = Tag::Category.create! valid_attributes
  #     delete :destroy, {:id => category.to_param}, valid_session
  #     expect(response).to redirect_to(tag_categories_url)
  #   end
  # end

end
