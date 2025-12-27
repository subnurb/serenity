# Contributing to Serenity Theme

Thank you for your interest in contributing to the Serenity theme! This document provides guidelines and instructions for contributing.

## Code of Conduct

Please be respectful and considerate in all interactions. We aim to maintain a welcoming and inclusive environment.

## How to Contribute

### Reporting Bugs

1. Check if the issue already exists in [GitHub Issues](https://github.com/subnurb/serenity/issues)
2. If not, create a new issue with:
   - Clear, descriptive title
   - Steps to reproduce
   - Expected vs actual behavior
   - PrestaShop version
   - Browser and OS information
   - Screenshots if applicable

### Suggesting Features

1. Open a new issue with the `enhancement` label
2. Describe the feature and its use case
3. Explain why it would benefit users

### Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Test thoroughly
5. Commit with clear messages
6. Push to your fork
7. Open a Pull Request

## Development Setup

```bash
# Clone your fork
git clone https://github.com/YOUR-USERNAME/serenity.git
cd serenity

# Install dependencies
npm install

# Build in development mode
npm run build:dev

# Watch for changes
npm run watch
```

## Coding Standards

### SCSS
- Use the existing variable system in `src/scss/abstract/variables/`
- Follow BEM naming convention for new components
- Keep selectors specific but not overly nested (max 3 levels)

### JavaScript/TypeScript
- Follow existing code patterns
- Use TypeScript for new files
- Run `npm run lint` before committing

### Templates
- Follow Smarty best practices
- Maintain accessibility (ARIA labels, semantic HTML)
- Test with RTL languages

## Commit Messages

Use clear, descriptive commit messages:

```
feat: Add dark mode toggle
fix: Correct button hover color
docs: Update installation instructions
style: Format SCSS files
refactor: Simplify product card component
```

## Testing

Before submitting a PR:

1. Test on multiple browsers (Chrome, Firefox, Safari, Edge)
2. Test on mobile devices
3. Test with RTL languages if applicable
4. Run `npm run build` to ensure production build works
5. Verify no console errors

## Questions?

Open a discussion or issue on GitHub if you need help.

Thank you for contributing!
