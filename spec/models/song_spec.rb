require 'rails_helper'

RSpec.describe Song, type: :model do
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
    song = Song.create(
      song_name: 'Perfected'
    )
    expect(song.errors[:organization_id]).to_not be_empty
  end

  it "should validate song_name" do 
    song = Song.create(
      organization_id: 1
    )
    expect(song.errors[:song_name]).to_not be_empty
  end
end