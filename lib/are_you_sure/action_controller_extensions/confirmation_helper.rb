module AreYouSure
  module ActionControllerExtensions
    module ConfirmationHelper
      SESSION_KEY = :are_you_sure_model_attributes

      def memorize_confirmed(model)
        session[SESSION_KEY] = model.attributes
      end

      def confirm_for(model)
        model.extend(Confirmable).tap do |model|
          model.prepare_confirmation(param_confirmed)
        end
      end

      def fill_confirmed(model)
        confirm_for(model).tap do |model|
          model.attributes = session[SESSION_KEY]
          session[SESSION_KEY] = nil
        end
      end

    private

      def param_confirmed
        params[:confirmed]
      end
    end
  end
end
