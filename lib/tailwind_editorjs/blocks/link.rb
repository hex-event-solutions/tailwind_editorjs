# frozen_string_literal: true

require 'tailwind_editorjs/blocks/base'

module TailwindEditorjs
  module Blocks
    class Link < Base

      template <<~HTML
        <div class="w-full flex flex-col items-center">
          <a href="<%= link %>" class="w-full p-4 border border-gray-500 border-2 rounded-lg shadow-lg max-w-[30vw]">
            <div class="flex flex-row items-center">
              <div class="flex-grow">
                <h2 class="text-2xl"><%= title %></h2>
                <p><%= description %></p>
              </div>
              <% unless image.empty? %>
                <div class="h-32 w-32">
                  <img src="<%= image %>">
                </div>
              <% end %>
            </div>
          </a>
        </div>
      HTML

      def link
        data[:link]
      end

      def title
        data[:meta][:title]
      end

      def description
        data[:meta][:description]
      end

      def image
        data[:meta][:image][:url]
      end

    end
  end
end
