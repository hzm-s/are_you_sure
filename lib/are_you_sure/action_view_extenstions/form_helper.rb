module AreYouSure
  module ActionViewExtensions
    module FormHelper

      def are_you_sure_form_for(model, options={}, &block)
        options[:builder] = model.form_builder_class
        form_for(model, options, &block)
      end
    end
  end
end

ActionView::Base.send(:include, AreYouSure::ActionViewExtensions::FormHelper)
