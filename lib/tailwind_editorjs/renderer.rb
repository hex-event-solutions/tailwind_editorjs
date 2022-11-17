# frozen_string_literal: true

module TailwindEditorjs
  class Renderer

    class << self

      def render(data)
        new(data).render
      end

    end

    ALLOWED_BLOCKS = %w[
      paragraph
      header
      image
    ]

    def initialize(data)
      @data = data
    end

    def render
      data.to_s
    end

    private

    attr_reader :data

  end
end
