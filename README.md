## Reads 

## Getting Started
Reads is a blogging app i am building as part of Blinq's assesmennt test. This repository showcase my progress with app so far.

## Current Progress
- Integrated custom themedata, colors, and typography (Google fonts)
- Implemented Providers as the single source of truth for the app's state
- Implemented a category carousel in the AppBar
- Defined a fake Blog data and a model to structure 20 posts
- Implemented dynamic filtering of blog posts by category
- Added a "Recommended" section highlighting specific posts
- Created reusable UI components (`ShowCase`, `ShowcaseRecommendedCategories`) for blog post cards
- Added utility extensions for string manipulation

## Project Structure

```markdown
. 📂 assets
└── 📂 images/
│  ├── 📄 girl-removebg.png
│  ├── 📄 girl.png
│  └── 📄 girl2.png
```
```markdown
. 📂 lib
├── 📄 main.dart
└── 📂 models/
│  ├── 📄 blog.dart
└── 📂 screens/
│  ├── 📄 blog_post.dart
│  ├── 📄 home.dart
└── 📂 service/
│  ├── 📄 fake_blog_data.dart
└── 📂 state/
│  ├── 📄 blog_provider.dart
└── 📂 utils/
│  ├── 📄 app_theme_colors.dart
│  ├── 📄 app_theme_fonts.dart
│  ├── 📄 app_theme_spacing.dart
│  ├── 📄 string_extension.dart
└── 📂 widgets/
│  ├── 📄 categories.dart
│  └── 📄 showcase_categories.dart
```