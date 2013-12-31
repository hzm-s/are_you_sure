require 'action_view'
require 'are_you_sure/action_view_extenstions/form_helper'

module AreYouSure
  extend ActiveSupport::Autoload

  autoload :InputFormBuilder
  autoload :ConfirmFormBuilder

  eager_autoload do
    autoload :ModelWithConfirmation
  end
end
