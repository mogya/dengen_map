require 'rails_helper'

RSpec.describe "tag/categories/index", type: :view do
  before(:each) do
    assign(:tag_categories, [
      Tag::Category.create!(),
      Tag::Category.create!()
    ])
  end

  it "renders a list of tag/categories" do
    render
  end
end
