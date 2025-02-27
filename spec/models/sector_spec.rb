require 'rails_helper'

RSpec.describe Sector, type: :model do
  subject { build(:sector) }

  it { should validate_presence_of(:name) }
  it { should belong_to(:unit) }
  it { should have_many(:users) }
end