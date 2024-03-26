require 'rails_helper'

RSpec.describe Key, type: :model do
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

  let(:song) { organization.songs.create(
    song_name: "Perfected",
    )
  }

  let(:person) { organization.people.create(
    first_name: "Elizabeth",
    last_name: "Mountain"
    )
  }

  it "should validate person_id" do 
    key = Key.create(
      song_id: 1,
      song_key: "D"
    )
    expect(key.errors[:person_id]).to_not be_empty
  end

  it "should validate song_id" do 
    key = Key.create(
      person_id: 1,
      song_key: "D"
    )
    expect(key.errors[:song_id]).to_not be_empty
  end

  it "should validate song_key" do 
    key = Key.create(
      song_id: 1,
      person_id: 1
    )
    expect(key.errors[:song_key]).to_not be_empty
  end
end