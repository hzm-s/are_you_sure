module AreYouSure
  class ConfirmFormBuilder < ActionView::Helpers::FormBuilder

    def confirmation
      @template.hidden_field_tag('confirmed', true) + 
      @template.hidden_field_tag('form_mode', 'confirm')
    end

    def confirm_field(original_field, method, *options)
      field_value = fetch_field_value(original_field, method, *options)
      @template.content_tag(:p, field_value) +
      @template.hidden_field_tag(method, field_value)
    end

    def submit_or_confirm(values={})
      submit(values[:submit])
    end

    def method_missing(method, *args, &block)
      original_field = method.to_s.scan(/^(.+)_or_confirm$/).flatten.first
      super unless respond_to?(original_field.to_sym)
      send(:confirm_field, original_field, *args)
    end

  private

    def fetch_field_value(original_field, method, *options)
      field_value = @object.send(method)
      case original_field
      when /collection/
        options[0].detect {|i| i.send(options[1]) == field_value }.send(options[2])
      when /select/
        options.flatten.each_slice(2).to_a.detect {|i| i[1] == field_value }[0]
      else
        field_value
      end
    end
  end
end
