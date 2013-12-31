module AreYouSure
  class ConfirmFormBuilder < BaseFormBuilder

    def confirmation
      confirmed(true) + form_mode('confirm')
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
      do_if_respond_to_original_method(method) do |original_method|
        send(:confirm_field, original_method, *args)
      end
    end

  private

    def fetch_field_value(original_field, method, *options)
      field_value = @object.send(method)
      case original_field
      when /collection/
        options[0].detect {|i| i.send(options[1]) == field_value }.send(options[2])
      when /date|time/
        field_value
      when /select/
        options.flatten.each_slice(2).to_a.detect {|i| i[1] == field_value }[0]
      when /check/
        field_value ? options[1] || 'checked' : options[2] || ''
      else
        field_value
      end
    end
  end
end
