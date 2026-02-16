# frozen_string_literal: true

require 'tailwind_editorjs/blocks/base'

module TailwindEditorjs
  module Blocks
    class List < Base

      template <<~HTML
        <<%= tag %> class="<%= classes %> pl-4">
          <% items.each do |item| %>
            <li><%= item["content"] %></li>
          <% end %>
        </<%= tag %>>
      HTML

      def tag
        { 'ordered' => 'ol', 'unordered' => 'ul' }[data[:style]]
      end

      def classes
        { 'ordered' => 'list-decimal', 'unordered' => 'list-disc' }[data[:style]]
      end

      def items
        data[:items]
      end

    end
  end
end
