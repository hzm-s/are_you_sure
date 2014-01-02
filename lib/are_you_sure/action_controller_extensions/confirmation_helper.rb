module AreYouSure
  module ActionControllerExtensions
    module ConfirmationHelper

      def confirm_for(model)
        model.extend(Confirmable).tap do |model|
          model.confirmed = param_confirmed
        end
      end

      def param_confirmed
        params[:confirmed]
      end
    end
  end
end

ActionController::Base.send(:include, AreYouSure::ActionControllerExtensions::ConfirmationHelper)
