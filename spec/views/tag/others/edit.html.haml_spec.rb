require 'rails_helper'

RSpec.describe "tag/others/edit", type: :view do
  before(:each) do
    @tag_other = assign(:tag_other, Tag::Other.create!())
  end

  it "renders the edit tag_other form" do
    render

    assert_select "form[action=?][method=?]", tag_other_path(@tag_other), "post" do
    end
  end
end
