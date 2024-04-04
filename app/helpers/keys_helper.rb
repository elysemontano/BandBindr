module KeysHelper
    def decide_url(current_organization)
        if request.original_url.include?("people")
            @person = Person.find(params[:person_id])
            organization_person_keys_path(current_organization, @person)
        elsif request.original_url.include?("songs")
            @song = Song.find(params[:song_id])
            organization_song_keys_path(current_organization, @song)
        else
            root_path
        end
    end
end
