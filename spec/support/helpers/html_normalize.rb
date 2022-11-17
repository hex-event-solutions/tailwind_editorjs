module Helpers
  module HtmlNormalize
    def normalize(content)
      content.split("\n").map(&:strip).join
    end
  end
end
