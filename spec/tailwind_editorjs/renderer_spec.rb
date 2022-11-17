# frozen_string_literal: true

require 'tailwind_editorjs/renderer'

RSpec.describe TailwindEditorjs::Renderer do
  subject(:rendered_data) { described_class.render(data) }

  context 'when data is present' do
    let(:data) do
      {
        'time' => 1_668_643_001_447,
        'blocks' => [
          { 'id' => '6vlQpv7z9N', 'type' => 'header', 'data' => { 'text' => 'Big heading time', 'level' => 2 } },
          { 'id' => 'nsAx_0iRy8', 'type' => 'paragraph', 'data' => { 'text' => '' } },
          { 'id' => 'Sbk5aU6AVY', 'type' => 'paragraph', 'data' => { 'text' => 'Store the new words?' } },
          { 'id' => 'zo9xfLbzZw', 'type' => 'paragraph', 'data' => { 'text' => '' } },
          { 'id' => 'UsWvJYXMB9',
            'type' => 'image',
            'data' => {
              'file' => {
                'url' => 'some_url.png',
                'attachable_sgid' => 'some_attachable_sgid'
              },
              'caption' => '',
              'withBorder' => false,
              'stretched' => false,
              'withBackground' => false
            } }
        ],
        'version' => '2.25.0'
      }
    end

    it 'renders some data' do
      expect(rendered_data).to eq <<~HTML.chomp
        <h2 class="text-3xl">Big heading time</h2>
        <p class="p-2"></p>
        <p class="p-2">Store the new words?</p>
        <p class="p-2"></p>
      HTML
    end
  end
end
