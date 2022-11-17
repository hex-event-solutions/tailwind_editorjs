# frozen_string_literal: true

require 'tailwind_editorjs/blocks/base'

module TailwindEditorjs
  module Blocks
    class Image < Base

      template <<~HTML
        <div class="w-full flex flex-col items-center">
          <% if background? %><div class="bg-gray-500 rounded-lg p-4"><% end %>
            <figure class="<%= figure_classes %>">
              <img src="<%= url %>">
              <% unless caption.empty? %><figcaption>Some caption</figcaption><% end %>
            </figure>
          <% if background? %></div><% end %>
        </div>
      HTML

      def background?
        data[:withBackground]
      end

      def border?
        data[:withBorder]
      end

      def stretched?
        data[:stretched]
      end

      def caption
        data[:caption]
      end

      def url
        data[:file][:url]
      end

      def figure_classes
        [].tap do |classes|
          classes << 'max-w-[30vw]' unless stretched?
          classes << 'border border-gray-500 rounded-lg p-4' if border?
        end.join(' ')
      end

    end
  end
end
