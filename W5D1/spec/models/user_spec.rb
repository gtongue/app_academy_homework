require 'rails_helper'

describe User do
  subject(:user) do
    FactoryGirl.build(:user,
      email: "test@test.com",
      password: "password")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "correct password" do
      expect(user.is_password?("password")).to be true
    end

    it "bad password" do
      expect(user.is_password?("password2")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      token = user.session_token
      user.reset_session_token!
      expect(user.session_token).to_not eq(token)
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user given correct user/pass" do
      expect(User.find_by_credentials("test@test.com", "password")).to eq(user)
    end

    it "returns nil given incorrect user/pass" do
      expect(User.find_by_credentials("test@test.com", "password2")).to eq(nil)
    end
  end
end
