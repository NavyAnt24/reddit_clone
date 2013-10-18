require 'spec_helper'

describe Sub do
  before do
    @sub = FactoryGirl.create(:sub)
    @user = FactoryGirl.create(:user)
  end

  subject { @sub }

  it { should have_many(:links) }
  it { should belong_to(:moderator) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:moderator_id) }
  it { should validate_uniqueness_of(:name) }

  it "should require a name" do
    expect(FactoryGirl.build(:sub, :name => "")).not_to be_valid
  end


end
