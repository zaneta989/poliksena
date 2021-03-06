class ArticlesController < ApplicationController
  load_and_authorize_resource :only => [:create, :destroy]
  def new
    @article=Article.new
    authorize! :create, @article
  end
  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 2)
    authorize! :read, @articles


  end
  def show
    @article = Article.find(params[:id])
    authorize! :read, @article

  end
  def create


    authorize! :create, @article
    @article.author = current_user.username #or whatever is you session name

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  def edit

    @article = Article.find(params[:id])
    authorize! :update, @article

  end
  def update

    @article = Article.find(params[:id])
    authorize! :update, @article
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy

    @article = Article.find(params[:id])
    @article.destroy
    authorize! :destroy, @article


    redirect_to articles_path
  end
  private
  def article_params

    params.require(:article).permit(:title, :text, :tag_list, :author)
  end

end
