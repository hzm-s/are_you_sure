module AreYouSure
  class InputFormBuilder < BaseFormBuilder

    def confirmation(options={})
      confirmed(false)
    end

    def submit_or_confirm(options)
      value = options.delete(:confirm)
      submit(value || I18n.t('helpers.submit.confirm', default: 'Confirm'), options)
    end

    def method_missing(method, *args, &block)
      do_if_respond_to_original_method(method) do |original_method|
        send(original_method, *args, &block)
      end
    end
  end
end
