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
          {
            'id' => 'UsWvJYXMB9',
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
            }
          },
          {
            'id' => 'iZRk5Up4Sh',
            'type' => 'link',
            'data' => {
              'link' => 'https://google.com',
              'meta' => {
                'title' => 'Google',
                'description' => "Couldn't find a description",
                'image' => {
                  'url' => 'some_url.png'
                }
              }
            }
          }
        ],
        'version' => '2.25.0'
      }
    end

    it 'renders some data' do
      expect(rendered_data).to eq normalize <<~HTML
        <h2 class="text-3xl">Big heading time</h2>
        <p class="py-2"></p>
        <p class="py-2">Store the new words?</p>
        <p class="py-2"></p>
        <div class="w-full flex flex-col items-center">
          <figure class="max-w-[30vw]">
            <img src="some_url.png">
          </figure>
        </div>
        <div class="w-full flex flex-col items-center">
          <a href="https://google.com" class="w-full p-4 border border-gray-500 border-2 rounded-lg shadow-lg max-w-[30vw]">
            <div class="flex flex-row items-center">
              <div class="flex-grow">
                <h2 class="text-2xl">Google</h2>
                <p>Couldn't find a description</p>
              </div>
              <div class="h-32 w-32">
                <img src="some_url.png">
              </div>
            </div>
          </a>
        </div>
      HTML
    end
  end
end
