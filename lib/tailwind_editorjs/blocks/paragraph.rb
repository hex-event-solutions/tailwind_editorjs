# frozen_string_literal: true

require 'tailwind_editorjs/blocks/base'

module TailwindEditorjs
  module Blocks
    class Paragraph < Base

      template <<~HTML
        <p class="py-2">
          <%= text %>
        </p>
      HTML

      def text
        data[:text]
      end

    end
  end
end
