require 'rails_helper'

RSpec.describe SongTag, type: :model do
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

  let(:tag) { organization.tags.create(
    tag_word: "Original"
    )
  }

  it "should validate song_id" do 
    song_tag = SongTag.create(
      tag_id: 1,
    )
    expect(song_tag.errors[:song_id]).to_not be_empty
  end

  it "should validate tag_id" do 
    song_tag = SongTag.create(
      song_id: 1,
    )
    expect(song_tag.errors[:tag_id]).to_not be_empty
  end
end