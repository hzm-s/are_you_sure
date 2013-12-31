class LensesController < ApplicationController

  def index
    render text: 'lenses index'
  end

  def new
    @lens = AreYouSure::ModelWithConfirmation.new(Lens)
  end

  def create
    @lens = AreYouSure::ModelWithConfirmation.new(Lens, lens_params, confirmation_params)
    if @lens.save
      redirect_to lenses_path
    else
      render action: :new
    end
  end

private

  def lens_params
    params.require(:lens).permit(:mfr_id, :mount_id, :name, :mm, :f, :close_up, :note)
  end

  def confirmation_params
    params.permit(:form_mode, :confirmed)
  end
end
