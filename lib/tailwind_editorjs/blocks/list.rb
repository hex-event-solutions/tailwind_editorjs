# frozen_string_literal: true

require 'tailwind_editorjs/blocks/base'

module TailwindEditorjs
  module Blocks
    class List < Base

      template <<~HTML
        <<%= tag %> class="<%= classes %>">
          <% items.each do |item| %>
            <li><%= item[:content] %></li>
          <% end %>
        </<%= tag %>>
      HTML

      def tag
        { 'ordered' => 'ol', 'unordered' => 'ul' }[data[:style]]
      end

      def items
        data[:items]
      end

    end
  end
end
