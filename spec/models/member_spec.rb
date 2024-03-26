require 'rails_helper'

RSpec.describe Member, type: :model do
    let(:user) { User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
        )
    }
    let(:organization) { user.organizations.create(
        name: 'Organization 1'
        )
    }

    it "should validate user_id" do 
        member = Member.create(organization_id: organization.id)
        expect(member.errors[:user_id]).to_not be_empty
    end

    it "should validate organization_id" do 
        member = Member.create(user_id: user.id)
        expect(member.errors[:organization_id]).to_not be_empty
    end
end