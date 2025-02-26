require 'rails_helper'

RSpec.describe Unit, type: :model do
    subject { build(:unit) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
end
