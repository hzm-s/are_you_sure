require 'rails'

module AreYouSure
  class Railtie < ::Rails::Railtie
    initializer 'are_you_sure' do
      ActiveSupport.on_load(:action_controller) do
        require 'are_you_sure/action_controller_extensions/confirmation_helper'
        ActionController::Base.send(:include, AreYouSure::ActionControllerExtensions::ConfirmationHelper)
      end

      ActiveSupport.on_load(:action_view) do
        require 'are_you_sure/action_view_extensions/form_helper'
        ActionView::Base.send(:include, AreYouSure::ActionViewExtensions::FormHelper)
      end
    end
  end
end
