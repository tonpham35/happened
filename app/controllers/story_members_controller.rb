class StoryMembersController < ApplicationController
  def create
    @story = Story.find(params[:story_members][:story_id])

    params["story_members"]["participant"].each do |a|
      x = User.find_by(first_name: a)
      x = x.id
      @story_members = @story.story_members.create(:story_id => params[:story_id], :user_id => x)
    end

      redirect_to root_path

  end
end
