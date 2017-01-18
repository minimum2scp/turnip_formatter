module TurnipFormatter
  module StepTemplate
    class Base
      class << self
        def inherited(child)
          TurnipFormatter.step_templates << child.new
        end

        def on_passed(template)
          hooks[:passed] << template
        end

        def on_failed(template)
          hooks[:failed] << template
        end

        def on_pending(template)
          hooks[:pending] << template
        end

        def hooks
          @hooks ||= { passed: [], failed: [], pending: [] }
        end

        #
        # Return SCSS string that be used in this class
        #
        def css
          ''
        end
      end

      def formatted_backtrace(example, exception = nil)
        RSpec::Core::Formatters::TurnipFormatter.formatted_backtrace(example, exception)
      end
    end
  end
end
