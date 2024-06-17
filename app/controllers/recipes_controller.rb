class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :content)
  end

end
