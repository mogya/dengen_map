require 'rails_helper'

RSpec.describe "tag/categories/edit", type: :view do
  before(:each) do
    @tag_category = assign(:tag_category, Tag::Category.create!())
  end

  it "renders the edit tag_category form" do
    render

    assert_select "form[action=?][method=?]", tag_category_path(@tag_category), "post" do
    end
  end
end
