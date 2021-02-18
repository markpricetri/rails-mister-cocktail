
class DosesController < ApplicationController
  def new
    @dose = Dose.new # this is for the form
    @cocktail = Cocktail.find(params[:cocktail_id]) # this is for the form
  end

  def create
    @dose = Dose.new(description: params[:dose][:description])
    @cocktail = Cocktail.find(params[:cocktail_id]) # this is for the form
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save!
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new #.html.erb
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy # from the DB. The @dose is still here in the RAM
    @cocktail = @dose.cocktail
    redirect_to cocktail_path(@cocktail.id)
  end

  private

end