class LensesController < ApplicationController

  def show
    @lens = Lens.find(params[:id])
  end

  def new
    @lens = confirm_for Lens.new
  end

  def create
    @lens = confirm_for Lens.new(lens_params)
    if @lens.save_if_confirmed
      redirect_to lens_path(@lens)
    else
      render action: :new
    end
  end

  def edit
    @lens = confirm_for Lens.find(params[:id])
  end

  def update
    @lens = confirm_for Lens.find(params[:id])
    if @lens.update_if_confirmed(lens_params)
      redirect_to lens_path(@lens)
    else
      render action: :edit
    end
  end

private

  def lens_params
    params.require(:lens).permit(:registered_at, :mfr_id, :mount_id, :name, :mm, :f, :close_up, :note)
  end
end
