# App Architecture Documentation

## 1) Big Picture: How this app is structured

This project follows a common Flutter pattern:

- `main.dart` = app entry point
- `router/` = navigation map (which screen path opens which page)
- `screens/` = full pages (Home, Search, Premium, etc.)
- `widgets/` = reusable UI components
- `data/` = models + mock content
- `theme/` = centralized colors, text styles, theme config

### Why this is good for beginners:

- You keep logic separated from UI pieces.
- You avoid giant files.
- Reusable widgets reduce copy-paste.
- Easier to debug and scale later.

## 2) lib/ folder guide (what each folder means)

### lib/main.dart

- Starts app with `ProviderScope` (Riverpod root).
- Uses `MaterialApp.router(...)` instead of `MaterialApp(...)`, because navigation is route-based via `go_router`.
- Applies global theme via `AppTheme.darkTheme`.

### lib/router/

**app_router.dart**

Defines all app routes:
- `/login`
- `/home`
- `/search`
- `/search/focused`
- `/library`
- `/premium`
- `/create`

Uses `ShellRoute` so bottom nav + playback bar stay visible across main screens.  
Uses `CustomTransitionPage` for `/create` modal fade overlay.

**Why it's structured this way:**  
Central route config avoids scattered navigation logic.

### lib/screens/

Each subfolder is a full page screen:

- `login/login_screen.dart` -> login/signup landing UI
- `home/home_screen.dart` -> main feed (genres, grid, mixes, side nav trigger)
- `search/search_screen.dart` -> search landing with sections
- `search/search_tapped_screen.dart` -> focused search view + recent searches
- `library/library_screen.dart` -> placeholder library page
- `premium/premium_screen.dart` -> premium upsell UI
- `create/create_screen.dart` -> create-modal actions

**Why:** One file per page keeps screen-level UI isolated and easy to find.

### lib/widgets/

Reusable UI blocks:

- `shell_scaffold.dart` -> shared scaffold + bottom navigation + playback bar
- `home_side_nav.dart` -> left slide-in side panel on Home
- `playback_bar.dart` -> mini player row
- `genre_chip.dart`, `song_tile.dart`, `mix_card.dart`, `artist_card.dart`, `section_header.dart` -> smaller reusable design pieces

**Why:** Makes large screens (like Home) cleaner and composable.

### lib/data/

- `models/` contains simple data classes (Song, Mix, Genre, Artist)
- `mock_data.dart` contains hardcoded lists used by UI

**Why:**
- Separates sample data from UI code.
- Easy to replace later with API/service layer.

### lib/theme/

- `app_colors.dart` -> shared color tokens
- `app_text_styles.dart` -> typography presets (Google Fonts)
- `app_theme.dart` -> app-level theme setup (ThemeData)

**Why:** Central styling ensures consistency and faster redesigns.

## 3) File-by-file quick purpose map (inside lib/)

| File | Purpose |
|------|---------|
| `main.dart` | bootstraps app + routing + theme |
| `router/app_router.dart` | navigation structure + nested routes |
| `data/models/*.dart` | plain immutable model classes |
| `data/mock_data.dart` | dummy data for lists/cards/search |
| `theme/app_colors.dart` | color constants |
| `theme/app_text_styles.dart` | reusable text styles |
| `theme/app_theme.dart` | global dark theme |
| `screens/*/*.dart` | page UIs |
| `widgets/*.dart` | reusable visual components and shell structure |

## 4) Dependencies: what they do and why used

From `pubspec.yaml`:

| Dependency | Purpose |
|------------|---------|
| **flutter** | Core Flutter SDK, UI framework |
| **cupertino_icons** | iOS-style icon pack (useful for platform-consistent icons) |
| **flutter_riverpod** | State management framework. Current app uses `ProviderScope`, but no advanced providers yet. Good future-proofing for scaling app state |
| **go_router** | Declarative routing/navigation. Cleaner route trees, nested navigation (`ShellRoute`), deep-link friendly |
| **google_fonts** | Easy font styling via `GoogleFonts.montserrat`, `GoogleFonts.nunito` |

### Dev dependencies

- `flutter_test` for tests
- `flutter_lints` for linting/style checks

## 5) Suggested "next improvements" for beginners

1. Add comments to each screen explaining widget tree purpose.
2. Introduce Riverpod `StateProvider` for selected genre or search query.
3. Replace `mock_data.dart` with a repository/service class.
4. Add README architecture diagram (flow: router -> shell -> screen -> widgets -> data).
5. Add golden/widget tests for `HomeScreen` and `ShellScaffold`.