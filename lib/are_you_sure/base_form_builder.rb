module AreYouSure
  class BaseFormBuilder < ActionView::Helpers::FormBuilder

    def confirmed(true_or_false)
      @template.hidden_field_tag(:confirmed, true_or_false)
    end

    def form_mode(mode)
      @template.hidden_field_tag(:form_mode, mode)
    end

  private

    def do_if_respond_to_original_method(method)
      original_method = extract_original_method(method)
      unless original_method and respond_to?(original_method)
        super
      else
        yield(original_method)
      end
    end

    def extract_original_method(method)
      method.to_s.scan(/^(.+)_or_confirm$/).flatten.first
    end
  end
end
