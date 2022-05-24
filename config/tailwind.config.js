const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*'
  ],
  theme: {
    container: {
      center: true,
      padding: '2rem'
    },
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      animation: {
        fade: 'fadeOut 5s ease-in-out',
        spinSlowPingPulse: 'spin 2s ease-in 2s infinite alternate, pulse 2s ease-in infinite, ping 2s ease-in infinite'
      },
      colours: {
        primary: '#264653',
        secondary: '#e76f51'
      },
      keyframes: theme => ({
        fadeOut: {
          '100%': { backgroundColor: theme('colors.transparent') }
        }
      }),
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
