require 'rails_helper'

RSpec.describe LandingController, type: :controller do
  describe "get index" do
    context "when logged-in" do
      login_user
      it "should have a current_user" do
        get 'index'
        expect(subject.current_user).not_to be_nil
      end
    end
    context "when not logged-in" do
      it "should not have a current_user" do
        get 'index'
        expect(subject.current_user).to be_nil
      end
    end
  end
end
