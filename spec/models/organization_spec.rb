require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
    }
  it "should validate name" do 
    organization = user.organizations.create()
    expect(organization.errors[:name]).to_not be_empty
  end

end