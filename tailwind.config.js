module.exports = {
  content: [
    './lib/tailwind_editorjs/blocks/*.html.erb',
  ],
  plugins: [
    require('@tailwindcss/typography'),
  ],
  mode: 'jit'
}
