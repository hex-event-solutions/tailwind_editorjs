# frozen_string_literal: true

require 'tailwind_editorjs/renderer'

RSpec.describe TailwindEditorjs::Renderer do
  subject(:rendered_data) { described_class.render(data) }

  context 'when data is present' do
    let(:data) { 1 }

    it 'renders some data' do
      expect(rendered_data).to eq '1'
    end
  end
end
