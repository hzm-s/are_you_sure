require 'action_controller'
require 'action_view'
require 'are_you_sure/action_controller_extensions/confirmation_helper'
require 'are_you_sure/action_view_extenstions/form_helper'

module AreYouSure
  extend ActiveSupport::Autoload

  autoload :Confirmable

  autoload_under 'FormBuilders' do
    autoload :BaseFormBuilder
    autoload :InputFormBuilder
    autoload :ConfirmFormBuilder
  end
end
