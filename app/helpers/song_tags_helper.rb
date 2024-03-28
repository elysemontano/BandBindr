# app/helpers/song_tags_helper.rb

module SongTagsHelper
    def grouped_tag_options
      grouped_options = {}
  
      # Add existing tags to the "Existing Tags" group
      grouped_options['Existing Tags'] = @current_organization.tags.map { |tag| [tag.tag_word, tag.id] }
  
      # Add the option to add a new tag to the "Add New Tag" group
      grouped_options['Add New Tag'] = [['Add New Tag', 'new_tag']]
  
      grouped_options
    end
  end
  