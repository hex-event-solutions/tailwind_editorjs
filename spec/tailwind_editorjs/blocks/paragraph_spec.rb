# frozen_string_literal: true

require 'tailwind_editorjs/blocks/paragraph'

RSpec.describe TailwindEditorjs::Blocks::Paragraph do
  subject(:rendered_paragraph) { described_class.new(data).call }

  let(:data) do
    {
      text: 'Body'
    }
  end

  it 'renders the correct html' do
    expect(rendered_paragraph).to eq <<~HTML.chomp
      <p class="p-2">Body</p>
    HTML
  end
end
