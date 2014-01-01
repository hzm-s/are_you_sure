module AreYouSure
  module ActionControllerExtensions
    module ConfirmationHelper

      def confirm_for(model)
        ModelWithConfirmation.new(param_confirmed).tap do |c|
          c.model = model
        end
      end

      def param_confirmed
        params[:confirmed]
      end
    end
  end
end

ActionController::Base.send(:include, AreYouSure::ActionControllerExtensions::ConfirmationHelper)
