require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:user) { User.create(
    email: 'test@example.com',
    password: 'password',
    password_confirmation: 'password'
    )
  }

  let(:organization) { user.organizations.create(
    name: "Organization 1"
    )
  }

  it "should validate organization_id" do 
    tag = Tag.create(
      tag_word: 'original'
    )
    expect(tag.errors[:organization_id]).to_not be_empty
  end

  it "should validate tag_word" do 
    tag = Tag.create(
      organization_id: 1
    )
    expect(tag.errors[:tag_word]).to_not be_empty
  end
end