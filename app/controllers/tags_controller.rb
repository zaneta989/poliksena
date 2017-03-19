class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @article= Article.tagged_with(@tag.name)
  end
  def destroy
    @tag.remove( ActsAsTaggableOn::Tag.find(params[:id]))

    redirect_to articles_path
  end
end