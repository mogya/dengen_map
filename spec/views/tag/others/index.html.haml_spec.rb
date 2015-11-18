require 'rails_helper'

RSpec.describe "tag/others/index", type: :view do
  before(:each) do
    assign(:tag_others, [
      Tag::Other.create!(),
      Tag::Other.create!()
    ])
  end

  it "renders a list of tag/others" do
    render
  end
end
