# frozen_string_literal: true

require 'tailwind_editorjs/blocks/image'

RSpec.describe TailwindEditorjs::Blocks::Image do
  subject(:rendered_block) { described_class.new(data).call }

  let(:data) do
    {
      file: {
        url: 'some_url.png',
        attachable_sgid: 'some_attachable_sgid'
      },
      caption: caption,
      withBorder: with_border,
      stretched: stretched,
      withBackground: with_background
    }
  end
  let(:caption) { '' }
  let(:with_border) { false }
  let(:stretched) { false }
  let(:with_background) { false }

  shared_examples 'a correctly rendered image' do |body|
    it 'renders the correct html' do
      expect(rendered_block).to eq normalize(body)
    end
  end

  context 'when it is in the default setting' do
    it_behaves_like 'a correctly rendered image', <<~HTML.chomp
      <div class="w-full flex flex-col items-center py-8">
        <figure class="max-w-[30vw]">
          <img src="some_url.png">
        </figure>
      </div>
    HTML
  end

  context 'when there is a caption' do
    let(:caption) { 'Some caption' }

    it_behaves_like 'a correctly rendered image', <<~HTML.chomp
      <div class="w-full flex flex-col items-center py-8">
        <figure class="max-w-[30vw]">
          <img src="some_url.png">
          <figcaption>Some caption</figcaption>
        </figure>
      </div>
    HTML
  end

  context 'when it is stretched' do
    let(:stretched) { true }

    context 'when it is bordered' do
      let(:with_border) { true }

      context 'when it has a background' do
        let(:with_background) { true }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <div class="bg-gray-500 rounded-lg p-4">
              <figure class="border border-gray-500 rounded-lg p-4">
                <img src="some_url.png">
              </figure>
            </div>
          </div>
        HTML
      end

      context 'when it does not have a background' do
        let(:with_background) { false }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <figure class="border border-gray-500 rounded-lg p-4">
              <img src="some_url.png">
            </figure>
          </div>
        HTML
      end
    end

    context 'when it is not bordered' do
      let(:with_border) { false }

      context 'when it has a background' do
        let(:with_background) { true }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <div class="bg-gray-500 rounded-lg p-4">
              <figure class="">
                <img src="some_url.png">
              </figure>
            </div>
          </div>
        HTML
      end

      context 'when it does not have a background' do
        let(:with_background) { false }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <figure class="">
              <img src="some_url.png">
            </figure>
          </div>
        HTML
      end
    end
  end

  context 'when it is not stretched' do
    let(:stretched) { false }

    context 'when it is bordered' do
      let(:with_border) { true }

      context 'when it has a background' do
        let(:with_background) { true }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <div class="bg-gray-500 rounded-lg p-4">
              <figure class="max-w-[30vw] border border-gray-500 rounded-lg p-4">
                <img src="some_url.png">
              </figure>
            </div>
          </div>
        HTML
      end

      context 'when it does not have a background' do
        let(:with_background) { false }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <figure class="max-w-[30vw] border border-gray-500 rounded-lg p-4">
              <img src="some_url.png">
            </figure>
          </div>
        HTML
      end
    end

    context 'when it is not bordered' do
      let(:with_border) { false }

      context 'when it has a background' do
        let(:with_background) { true }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <div class="bg-gray-500 rounded-lg p-4">
              <figure class="max-w-[30vw]">
                <img src="some_url.png">
              </figure>
            </div>
          </div>
        HTML
      end

      context 'when it does not have a background' do
        let(:with_background) { false }

        it_behaves_like 'a correctly rendered image', <<~HTML.chomp
          <div class="w-full flex flex-col items-center py-8">
            <figure class="max-w-[30vw]">
              <img src="some_url.png">
            </figure>
          </div>
        HTML
      end
    end
  end
end
