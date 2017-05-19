class DosesController < ApplicationController
    def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_attributes)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy
    redirect_to cocktail_path(dose.cocktail)
  end

  private

  def dose_attributes
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
