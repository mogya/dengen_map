require 'rails_helper'

RSpec.describe "tag/categories/show", type: :view do
  before(:each) do
    @tag_category = assign(:tag_category, Tag::Category.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
