require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@user.com", password: "password") }

  it { is_expected.to have_many(:wikis) }
  it { is_expected.to have_many(:collaborators) }
end
