module SimpleForm
  module Components
    # Needs to be enabled in order to do automatic lookups
    module Span
      # Name of the component method
      def span
        @span ||= begin
          options[:span].to_s.html_safe if options[:span].present?
        end
      end

      # Used when the span is optional
      def has_span?
        span.present?
      end
    end
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Span)
