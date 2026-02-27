## BeCalm

## Getting Started
BeCalm is a blogging app i am building as part of Blinq's assesmennt test. This repository showcase my progress with app so far.

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
- Video Content Support: Integrated video player for video-type blog posts
- Responsive Navigation: Seamless switching between horizontal and vertical list views
- Cross-Screen Category Filtering: Navigate to filtered category views directly from blog post tags
- Author Profiles: Detailed author information with verification badges
- Multi-Provider Architecture: Scalable state management using `MultiProvider`
- Onboarding Screen
- A functional bottom Navigationbar

## Project Structure

```markdown
. 📂 assets
└── 📂 fix/
│  ├── 📄 girl-bluff.png
│  ├── 📄 girl-down.png
│  ├── 📄 girl-laugh.png
│  ├── 📄 girl-mean.png
│  ├── 📄 girl-serious.png
│  ├── 📄 girl-shocked-2.png
│  ├── 📄 girl-shocked.png
│  ├── 📄 girl-smile.png
│  ├── 📄 girl-stern.png
└── 📂 icons/
│  ├── 📄 check.png
└── 📂 images/
│  ├── 📄 Gemini_Generated_Image_fy9rqqfy9rqqfy9r.png
│  ├── 📄 cooking-girl.png
│  ├── 📄 doctor-lady.jpeg
│  ├── 📄 girl-bluff-removebg.png
│  ├── 📄 girl-down-removebg.png
│  ├── 📄 girl-laugh-removebg.png
│  ├── 📄 girl-mean-removebg.png
│  ├── 📄 girl-removebg.png
│  ├── 📄 girl2-removebg.png
│  ├── 📄 happy-removebg.png
│  ├── 📄 sad-girl-removebg.png
│  ├── 📄 sad-girl.png
│  ├── 📄 yoga.png
└── 📂 launcher/
│  ├── 📄 launcher.png
└── 📂 onboarding/
│  ├── 📄 expert.gif
│  ├── 📄 skils.gif
│  ├── 📄 update.gif
│  ├── 📄 verified.gif
│  ├── 📄 wears.gif
└── 📂 splash/
│  ├── 📄 Becalm-android.png
│  ├── 📄 Becalm-removebg.png
│  ├── 📄 Becalm.png
│  ├── 📄 beclam.png
└── 📂 video/
│  └── 📄 video.mp4
```
```markdown
. 📂 lib
├── 📄 main.dart
└── 📂 models/
│  ├── 📄 blog.dart
│  ├── 📄 onboarding_page_model.dart
│  ├── 📄 search_carousel.dart
└── 📂 screens/
│  ├── 📄 blog_post.dart
│  ├── 📄 home.dart
│  ├── 📄 notification.dart
│  ├── 📄 onboarding_screen.dart
│  ├── 📄 post.dart
│  ├── 📄 screen_shell.dart
│  ├── 📄 search.dart
│  ├── 📄 user.dart
└── 📂 service/
│  ├── 📄 fake_blog_data.dart
│  ├── 📄 onboarding_data.dart
│  ├── 📄 search_blog_carousel_data.dart
│  ├── 📄 search_top_blog.dart
└── 📂 state/
│  ├── 📄 blog_provider.dart
│  ├── 📄 onboarding_screen_provider.dart
│  ├── 📄 screen_shell_provider.dart
│  ├── 📄 search_carousel_provider.dart
│  ├── 📄 video_provider.dart
└── 📂 utils/
│  ├── 📄 app_theme_colors.dart
│  ├── 📄 app_theme_fonts.dart
│  ├── 📄 app_theme_spacing.dart
│  ├── 📄 string_extension.dart
└── 📂 widgets/
│  ├── 📄 categories_containers.dart
│  ├── 📄 my_button.dart
│  ├── 📄 onboarding_page.dart
│  └── 📄 showcase.dart
```