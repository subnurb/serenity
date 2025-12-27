# Serenity Theme for PrestaShop

A modern, elegant PrestaShop theme designed with a "slow life, natural look" philosophy. Built on the official Hummingbird theme foundation for stability and compatibility.

![Serenity Theme Preview](preview.png)

## Features

- **Natural Color Palette** - Warm, earthy tones with sage green accents
- **Elegant Typography** - Playfair Display for headings, Lato for body text
- **Smooth Animations** - Subtle, deliberate transitions for a calm user experience
- **Mobile Responsive** - Fully optimized for all device sizes
- **RTL Support** - Right-to-left language support included
- **Bootstrap 5.3** - Modern CSS framework foundation
- **Accessibility** - WCAG compliant focus states and contrast ratios

## Requirements

- PrestaShop 8.1.0 or higher
- PHP 7.4 or higher
- Node.js 14+ (for development)

## Installation

### Via PrestaShop Back Office

1. Download the latest release (`serenity.zip`) from [Releases](https://github.com/subnurb/serenity/releases)
2. Go to **Design > Theme & Logo** in your PrestaShop admin
3. Click **Add new theme**
4. Upload the `serenity.zip` file
5. Click **Use this theme**

### Manual Installation

1. Extract `serenity.zip` to your PrestaShop `themes/` directory
2. Go to **Design > Theme & Logo** in your PrestaShop admin
3. Select **Serenity** and click **Use this theme**

## Development

### Prerequisites

```bash
node -v  # Should be 14.x or higher
npm -v   # Should be 6.x or higher
```

### Setup

```bash
# Clone the repository
git clone https://github.com/subnurb/serenity.git
cd serenity

# Install dependencies
npm install
```

### Build Commands

```bash
# Production build
npm run build

# Development build (faster, with source maps)
npm run build:dev

# Watch mode (auto-rebuild on changes)
npm run watch

# Lint code
npm run lint

# Run tests
npm test
```

### Using PowerShell Scripts

```powershell
# Build the theme
.\build.ps1

# Package for distribution
.\package.ps1
```

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Cream | `#F9F7F4` | Body background |
| Pearl | `#F5F2ED` | Cards, light backgrounds |
| Sand | `#E8E2D9` | Borders, dividers |
| Clay | `#C4B8A8` | Secondary text |
| Sage | `#A8B5A0` | Primary accent (buttons, links) |
| Charcoal | `#3D3A37` | Body text |
| Rose | `#D4B8B8` | Sale badges, wishlist |
| Honey | `#D4C498` | Rating stars, warnings |

## File Structure

```
serenity/
├── assets/              # Compiled CSS, JS, fonts
├── config/              # Theme configuration
│   └── theme.yml        # Main theme config
├── modules/             # Module template overrides
├── src/                 # Source files
│   ├── js/              # TypeScript/JavaScript
│   └── scss/            # SCSS stylesheets
│       ├── abstract/    # Variables, mixins
│       ├── core/        # Core Bootstrap styles
│       ├── custom/      # Custom component styles
│       └── theme.scss   # Main entry point
├── templates/           # Smarty templates
├── translations/        # Language files
├── build.ps1            # Build script
├── package.ps1          # Packaging script
└── package.json         # NPM configuration
```

## Customization

### Changing Colors

Edit `src/scss/abstract/variables/overrides/_overrides.scss`:

```scss
// Change the primary color
$serenity-sage: #A8B5A0;  // Your new color
$primary: $serenity-sage;
```

### Changing Fonts

1. Update `src/scss/abstract/variables/bootstrap/_fonts.scss`
2. Update Google Fonts link in `templates/_partials/head.tpl`

### Adding Custom Styles

Add your custom styles to `src/scss/custom/_serenity.scss`

## Browser Support

- Chrome (last 2 versions)
- Firefox (last 2 versions)
- Safari (last 2 versions)
- Edge (last 2 versions)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the Academic Free License 3.0 (AFL-3.0) - see the [LICENSE](LICENSE) file for details.

## Credits

- Built on [Hummingbird](https://github.com/PrestaShop/hummingbird) theme by PrestaShop
- [Bootstrap 5](https://getbootstrap.com/) CSS framework
- [Google Fonts](https://fonts.google.com/) - Lato & Playfair Display
- [Material Design Icons](https://materialdesignicons.com/)

## Support

- [Report Issues](https://github.com/subnurb/serenity/issues)
- [Documentation](https://github.com/subnurb/serenity/wiki)

---

Made with care for a more peaceful e-commerce experience.
