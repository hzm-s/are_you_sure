module AreYouSure
  class InputFormBuilder < ActionView::Helpers::FormBuilder

    def confirmation
      @template.hidden_field_tag('confirmed', false) +
      @template.hidden_field_tag('form_mode', 'confirm')
    end

    def submit_or_confirm(values={})
      submit(values[:confirm] || 'Confirm')
    end

    def method_missing(method, *args, &block)
      field_method = method.to_s.scan(/^(.+)_or_confirm$/).flatten.first
      super unless field_method
      send(field_method, *args, &block)
    end
  end
end
