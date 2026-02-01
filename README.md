## Reads 

## Getting Started
Reads is a blogging app i am building as part of Blinq's assesmennt test. This repository showcase my progress with app so far.

## Features
- Custom themedata, colors, and typography (Google fonts)
- Providers as the single source of truth for the app's state
- Category carousel in the AppBar
- Fake Blog data and a model to structure 20 posts
- A Dynamic filtering of blog posts by category
- A "Recommended" section highlighting specific posts
- Reusable UI component (`ShowCase`) for blog post cards
- Utility extensions for string manipulation
- A Blog Details screen with content and metadata
- A dynamic category-based card styling

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