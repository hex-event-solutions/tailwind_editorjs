# frozen_string_literal: true

require_relative 'blocks/header'
require_relative 'blocks/paragraph'
require_relative 'blocks/image'
require_relative 'blocks/link'

module TailwindEditorjs
  class Renderer

    class << self

      def render(data)
        new(data).render
      end

    end

    ALLOWED_BLOCKS = {
      paragraph: Blocks::Paragraph,
      header: Blocks::Header,
      image: Blocks::Image,
      link: Blocks::Link
    }.freeze

    def initialize(data)
      @data = data
    end

    def render
      data['blocks'].map do |block|
        block_type = block['type'].to_sym
        next unless ALLOWED_BLOCKS.key? block_type

        ALLOWED_BLOCKS[block_type].call(block['data'])
      end.compact.join
    end

    private

    attr_reader :data

  end
end
