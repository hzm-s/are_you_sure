module AreYouSure
  module ActionControllerExtensions
    module ConfirmationHelper

      def confirm_for(model)
        Confirmation.new(model).tap do |obj|
          obj.prepare_confirmation(param_confirmed, session)
        end
      end

      def fill_confirmed(model)
        confirm_for(model).tap do |model|
          model.fill_confirmed_attributes
        end
      end

    private

      def param_confirmed
        params[:confirmed]
      end
    end
  end
end
