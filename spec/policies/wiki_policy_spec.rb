require 'rails_helper'

RSpec.describe WikiPolicy do

  let(:user) { User.new }

  #Wiki { described_class }

  permissions ".scope" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :show? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update?, :edit? do
    pending "add some examples to (or delete) #{__FILE__}"
    # it "grants access to all users" do
    #   expect.to permit(User.new)
    # end
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
