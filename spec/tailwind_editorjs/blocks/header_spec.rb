# frozen_string_literal: true

require 'tailwind_editorjs/blocks/header'

RSpec.describe TailwindEditorjs::Blocks::Header do
  subject(:rendered_block) { described_class.new(data).call }

  let(:data) do
    {
      text: 'Heading',
      level: level
    }
  end

  shared_examples 'a correctly rendered header' do |level, body|
    let(:level) { level }

    it 'renders the correct html' do
      expect(rendered_block).to eq body
    end
  end

  it_behaves_like 'a correctly rendered header', 1, <<~HTML.chomp
    <h1 class="text-4xl">Heading</h1>
  HTML

  it_behaves_like 'a correctly rendered header', 2, <<~HTML.chomp
    <h2 class="text-3xl">Heading</h2>
  HTML

  it_behaves_like 'a correctly rendered header', 3, <<~HTML.chomp
    <h3 class="text-2xl">Heading</h3>
  HTML

  it_behaves_like 'a correctly rendered header', 4, <<~HTML.chomp
    <h4 class="text-xl">Heading</h4>
  HTML

  it_behaves_like 'a correctly rendered header', 5, <<~HTML.chomp
    <h5 class="text-lg">Heading</h5>
  HTML

  it_behaves_like 'a correctly rendered header', 6, <<~HTML.chomp
    <h6 class="text-base">Heading</h6>
  HTML
end
