class TagsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @articles = Article.tagged_with(@tag.name)
  end
  def destroy
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @tag.destroy
    render 'articles/index'
  end
  private
  def tag_params
    params.require(:acts_as_taggable_on_tag).permit(:id, :name)
  end
end