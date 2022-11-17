# frozen_string_literal: true

require 'tailwind_editorjs/blocks/base'

module TailwindEditorjs
  module Blocks
    class Header < Base

      template <<~HTML
        <<%= tag %> class="<%= classes %>">
          <%= text %>
        </<%= tag %>>
      HTML

      def tag
        %w[h1 h2 h3 h4 h5 h6][data[:level] - 1]
      end

      def classes
        %w[text-4xl text-3xl text-2xl text-xl text-lg text-base][data[:level] - 1]
      end

      def text
        data[:text]
      end

    end
  end
end
