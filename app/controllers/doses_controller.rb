class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to doses_path
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
  def set_dose
    @article = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
