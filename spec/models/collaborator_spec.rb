require 'rails_helper'

RSpec.describe Collaborator, type: :model do
  let(:user) { User.create!(email: "user@user.com", password: "password") }

  it { is_expected.to belong_to(:wikis) }
  it { is_expected.to belong_to(:collaborators) }
end
