require 'are_you_sure/attributes_cache'

module AreYouSure
  module ActionControllerExtensions
    module ConfirmationHelper

      def confirm_for(model)
        model.extend(Confirmable).tap do |model|
          model.prepare_confirmation(param_confirmed, AttributesCache.new(session))
        end
      end

      def fill_confirmed(model)
        confirm_for(model).tap do |model|
          model.fill_attributes
        end
      end

    private

      def param_confirmed
        params[:confirmed]
      end
    end
  end
end
