# frozen_string_literal: true

require 'tailwind_editorjs/blocks/link'

RSpec.describe TailwindEditorjs::Blocks::Link do
  subject(:rendered_block) { described_class.new(data).call }

  let(:data) do
    {
      link: 'https://google.com',
      meta: {
        title: 'Google',
        description: "Couldn't find a description",
        image: {
          url: 'some_url.png'
        }
      }
    }
  end

  it 'renders the correct html' do
    expect(rendered_block).to eq normalize <<~HTML
      <div class="w-full flex flex-col items-center py-2">
        <a href="https://google.com" class="w-full p-4 border border-gray-500 border-2 rounded-lg shadow-lg max-w-[40vw]">
          <div class="flex flex-row items-center gap-2">
            <div class="flex-grow">
              <h2 class="text-2xl">Google</h2>
              <p>Couldn't find a description</p>
            </div>
            <div class="h-32 w-32 flex items-center">
              <img src="some_url.png">
            </div>
          </div>
        </a>
      </div>
    HTML
  end
end
