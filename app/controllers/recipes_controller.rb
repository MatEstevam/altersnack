class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def generate
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    content = @recipe.generate_content
    @recipe.content = content
    authorize @recipe
    if content
      session[:recipe] = @recipe.attributes
      redirect_to preview_recipe_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def preview
    if session[:recipe]
      @recipe = Recipe.new(session[:recipe])
      authorize @recipe
      render :show
    else
      authorize Recipe.new
      redirect_to recipes_path
    end
  end

  def create
    @recipe = Recipe.new(session[:recipe])
    authorize @recipe
    if @recipe.save
      session.delete(:recipe)
      redirect_to @recipe
    else
      redirect_to preview_recipe_path, status: :unprocessable_entity
    end
  end

  def show
    @recipe ||= Recipe.find(params[:id])
    authorize @recipe

    if request.post?
      @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    end
  end

  def index
    @recipes = policy_scope(Recipe)
  end

  # def toggle_favorite
  #   authorize @recipe
  #   @recipe.update(favorited: !@recipe.favorited)
  #   redirect_to recipes_path
  # end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :content)
  end
end
