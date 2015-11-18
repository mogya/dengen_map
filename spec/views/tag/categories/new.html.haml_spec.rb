require 'rails_helper'

RSpec.describe "tag/categories/new", type: :view do
  before(:each) do
    assign(:tag_category, Tag::Category.new())
  end

  it "renders new tag_category form" do
    render

    assert_select "form[action=?][method=?]", tag_categories_path, "post" do
    end
  end
end
