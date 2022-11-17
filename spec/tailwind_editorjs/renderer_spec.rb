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
                'url' => 'https://ripple.local/rails/active_storage/blobs/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaEpJaWszWlRaaE1XWTVZUzFqWldFeUxUUTBNV010WW1VeU5pMWtZMlpoT0dNMU5HSXhPRFlHT2daRlZBPT0iLCJleHAiOm51bGwsInB1ciI6ImJsb2JfaWQifX0=--cfe5f1c06a199d0bdf394b710477a5cab2bd903d/big_email_logo.png',
                'attachable_sgid' => 'BAh7CEkiCGdpZAY6BkVUSSJXZ2lkOi8vcGxhdGZvcm0vQWN0aXZlU3RvcmFnZTo6QmxvYi83ZTZhMWY5YS1jZWEyLTQ0MWMtYmUyNi1kY2ZhOGM1NGIxODY_ZXhwaXJlc19pbgY7AFRJIgxwdXJwb3NlBjsAVEkiD2F0dGFjaGFibGUGOwBUSSIPZXhwaXJlc19hdAY7AFQw--c4c47077182b26735a8c4cccaad81278b9267267'
              },
              'caption' => '',
              'withBorder' => false,
              'stretched' => false,
              'withBackground' => false
            }
          }
        ],
        'version' => '2.25.0'
      }
    end

    it 'renders some data' do
      expect(rendered_data).to eq <<~HTML.chomp
        <p class="p-2"></p>
        <p class="p-2">Store the new words?</p>
        <p class="p-2"></p>
      HTML
    end
  end
end
