module Dyny
  # This plugs into Rails and allows to handle app/views/foo/bar.html.rb templates
  class TemplateHandler
    def call(_template, source_code = nil)
      return <<~RUBY
        #{source_code}
        return output_buffer
      RUBY
    end
  end
end

ActionView::Template.register_template_handler(:dyny, Dyny::TemplateHandler.new)
