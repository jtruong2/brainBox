require 'rails_helper'

RSpec.describe User, type: :model do
  it "can be created as admin" do
    admin = create(:user, role: 1)

    expect(admin.role).to eq('admin')
    expect(admin.admin?).to be_truthy
  end

  it "user can be created as default by default" do
    default = create(:user)

    expect(default.role).to eq('default')
    expect(default.default?).to be_truthy
  end

  it {should validate_uniqueness_of(:username)}
  it {should validate_presence_of(:password)}
end
