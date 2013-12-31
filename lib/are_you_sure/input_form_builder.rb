module AreYouSure
  class InputFormBuilder < BaseFormBuilder

    def confirmation
      confirmed(false) + form_mode('confirm')
    end

    def submit_or_confirm(values={})
      submit(values[:confirm] || 'Confirm')
    end

    def method_missing(method, *args, &block)
      do_if_respond_to_original_method(method) do |original_method|
        send(original_method, *args, &block)
      end
    end
  end
end
