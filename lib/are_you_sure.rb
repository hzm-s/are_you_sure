require 'are_you_sure/version'
require 'are_you_sure/confirmable'
require 'are_you_sure/railtie'

module AreYouSure
  extend ActiveSupport::Autoload

  autoload_under 'FormBuilders' do
    autoload :BaseFormBuilder
    autoload :InputFormBuilder
    autoload :ConfirmFormBuilder
  end
end
