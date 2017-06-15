class StoriesController < ApplicationController
	def create
		@story = current_user.stories.new(story_params)

		if @story.save
        redirect_to users_index_path
      else
        format.html { render :new }
      end
	end

	private
    def story_params
      params.require(:story).permit(:title, :description, :photo)
    end
end
