# frozen_string_literal: true

module TailwindEditorjs
  class Renderer

    class << self

      def render(data)
        new(data).render
      end

    end

    ALLOWED_BLOCKS = {
      paragraph: Blocks::Paragraph
      # header: Header
      # image: Image
    }.freeze

    def initialize(data)
      @data = data
    end

    def render
      data['blocks'].map do |block|
        block_type = block['type'].to_sym
        next unless ALLOWED_BLOCKS.key? block_type

        ALLOWED_BLOCKS[block_type].call(block['data'])
      end.compact.join("\n")
    end

    private

    attr_reader :data

  end
end
