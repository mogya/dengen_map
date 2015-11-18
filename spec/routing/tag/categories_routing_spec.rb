require "rails_helper"

RSpec.describe Tag::CategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag/categories").to route_to("tag/categories#index")
    end

    it "routes to #new" do
      expect(:get => "/tag/categories/new").to route_to("tag/categories#new")
    end

    it "routes to #show" do
      expect(:get => "/tag/categories/1").to route_to("tag/categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tag/categories/1/edit").to route_to("tag/categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tag/categories").to route_to("tag/categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag/categories/1").to route_to("tag/categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag/categories/1").to route_to("tag/categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag/categories/1").to route_to("tag/categories#destroy", :id => "1")
    end

  end
end
