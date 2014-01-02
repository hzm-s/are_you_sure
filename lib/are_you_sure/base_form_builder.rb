module AreYouSure
  class BaseFormBuilder < ActionView::Helpers::FormBuilder

    def confirmed(confirmed)
      @template.hidden_field_tag(:confirmed, confirmed ? 'confirmed' : '')
    end

  private

    def do_if_respond_to_original_method(method)
      original_method = extract_original_method(method)
      if respond_to_original_method?(original_method)
        yield(original_method)
      else
        super
      end
    end

    def respond_to_missing?(method, include_private=false)
      respond_to_original_method?(extract_original_method(method)) || super
    end

    def respond_to_original_method?(original_method)
      original_method && respond_to?(original_method)
    end

    def extract_original_method(method)
      method.to_s[/^(.+)_or_confirm$/, 1]
    end
  end
end
