require 'rails_helper'

RSpec.describe Person, type: :model do
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

  it "should validate organization id" do 
    person = Person.create(
      first_name: 'Elizabeth',
      last_name: 'Mountain'
    )
    expect(person.errors[:organization_id]).to_not be_empty
  end

  it "should validate first_name" do 
    person = Person.create(
      organization_id: 1,
      last_name: 'Mountain'
    )
    expect(person.errors[:first_name]).to_not be_empty
  end

  it "should validate last_name" do 
    person = Person.create(
      first_name: 'Elizabeth',
      organization_id: 1
    )
    expect(person.errors[:last_name]).to_not be_empty
  end
end