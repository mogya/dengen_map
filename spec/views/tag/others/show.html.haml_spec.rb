require 'rails_helper'

RSpec.describe "tag/others/show", type: :view do
  before(:each) do
    @tag_other = assign(:tag_other, Tag::Other.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
