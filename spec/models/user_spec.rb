require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  before { @user = FactoryGirl.create(:user) }
  subject { @user }

  it { should validate_uniqueness_of(:username) }
  it { should_not allow_mass_assignment_of(:password_digest) }
  it { should_not allow_mass_assignment_of(:session_token) }

  describe "user password should be nil" do
    before do
      @user.save!
      @user1 = User.first
    end
    subject { @user1 }

    its(:password) { should be_nil }
  end

  describe "::find_by_credentials" do
    before do
      @user.save!
      @user1 = User.find_by_credentials(@user.username, @user.password)
    end
    subject { @user1 }

    it { should_not be_nil }
  end

  describe "#reset_session_token!" do
    before do
      @user.save!
      @user1 = User.first
      @session_token = @user1.session_token
      @user1.reset_session_token!
    end

    subject { @user1 }

    its(:session_token) { should_not eq @session_token }
  end
end
