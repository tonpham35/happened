class StoriesController < ApplicationController
	def create
		@story = current_user.stories.new(story_params)

		if @story.save
      	@story.story_members.create(story_id: @story.id, user_id: current_user.id)
				redirect_to users_index_path
      else
        format.html { render :new }
      end
	end

  def show
    @story = Story.find(params[:id])
    @x = ENV["MAPS_API_KEY"]
  end

	private
    def story_params
      params.require(:story).permit(:title, :description, :photo)
    end
end
