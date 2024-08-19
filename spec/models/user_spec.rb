require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:password) }

  let(:user) { create(:user) }
  let(:user1) { build(:user, email: user.email) }

  it "expected validate uniqueness of email" do
    expect validate_uniqueness_of(:email).ignoring_case_sensitivity
    expect(user1).not_to be_valid
    expect(user1.errors[:email]).to be_present
  end

  it 'require valid email' do
    user_invalid = User.create(email: 'a@a.a')
    expect(user_invalid.errors[:email].size).to be>=1
  end

  it 'accepts valid email' do
    puts user.email
    expect(user.errors[:email].count).to eq 0
  end


end
