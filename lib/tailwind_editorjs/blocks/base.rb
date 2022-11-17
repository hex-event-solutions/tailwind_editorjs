# frozen_string_literal: true

require 'pathname'
require 'erb'

module TailwindEditorjs
  module Blocks
    class Base

      class << self

        attr_accessor :erb_template

        def template(erb_template)
          self.erb_template = erb_template
        end

      end

      def initialize(data)
        @data = symbolize data
      end

      def call
        ERB.new(self.class.erb_template).result(binding)
      end

      protected

      attr_reader :data

      private

      def symbolize(hash)
        hash.to_h do |key, value|
          [key.to_sym, value.is_a?(Hash) ? symbolize(value) : value]
        end
      end

    end
  end
end
