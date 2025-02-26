require 'rails_helper'

RSpec.describe Unit, type: :model do
    subject { build(:unit) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }

    it { should have_many(:sectors) }
    it { should have_many(:visits) }
    it { should have_many(:users) }
end
