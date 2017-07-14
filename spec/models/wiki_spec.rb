require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) { User.create!(email: "user@user.com", password: "password") }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", private: false) }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has title, body, and private attributes" do
      expect(wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body", private: false)
    end
  end
end
