require 'spec_helper'

describe Link do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:user_id) }

  it { should have_many(:comments) }
  it { should belong_to(:user) }
  it { should have_many(:subs) }

  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:url) }
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:user_id) }

end