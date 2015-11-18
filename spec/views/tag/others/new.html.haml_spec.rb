require 'rails_helper'

RSpec.describe "tag/others/new", type: :view do
  before(:each) do
    assign(:tag_other, Tag::Other.new())
  end

  it "renders new tag_other form" do
    render

    assert_select "form[action=?][method=?]", tag_others_path, "post" do
    end
  end
end
