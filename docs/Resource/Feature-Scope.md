# Spotify Clone UI 

## 1. Project Overview

UI-only Spotify clone based on the Figma design.

---

## 2. Tech Stack

| Concern | Choice |
|---|---|
| Framework | Flutter |
| Routing | `go_router` |
| State Management | `riverpod` |
| Font | Nunito (via `google_fonts`) |

> **Font note:** Circular is not available on Google Fonts. Use **Nunito** only. 

---

## 3. In-Scope Screens

All screens sourced from Figma

### 4.1 Login / Signup
- Spotify logo
- Email input, password input
- Login button, signup link
- UI only: no auth logic

### 4.2 Home
- Top bar: greeting + avatar
- Featured section
- Recently played horizontal row
- Made-for-you horizontal row
- Horizontal scroll cards

### 4.3 Search (Category Grid)
- Top bar
- Genre/category chips grid (colored rounded rects)

### 4.4 Search Results
- Active search input
- Recent searches list
- Live results list (songs, artists, albums): filtered from mock data

### 4.5 Your Library
- Filter chips: Playlists - Albums - Artists
- List of saved items
- Create playlist button (UI only)

### 4.6 Premium
- Plan comparison layout
- CTA buttons (UI only)

### 4.7 Now Playing
- Full-screen player
- Album art
- Song title + artist
- Progress bar (mock, non-functional seek)
- Playback controls: shuffle - prev - play/pause - next - repeat
- Queue button, heart icon

### 4.8 Playlist View
- Header: cover art + title + metadata
- Song list with `SongTile`
- Shuffle + Play buttons

### 4.9 Artist Page
- Artist hero image
- Follow button (UI toggle)
- Monthly listeners count
- Popular tracks list
- Discography section
- Related artists row

### 4.10 Album View
- Route: `/library/album/:id`
- Header: cover art + title + artist + year
- Song list with `SongTile`
- Play + Shuffle buttons


---

## 5. Out-of-Scope

### Settings (entire section)
- Account management
- Notification preferences
- Audio quality / download settings
- Privacy & social settings
- About / Help / Log out

### Podcasts
- Browse, episode list, episode player
- Subscription management

### Social
- Messages / New Message
- Blends
- Friend activity feed

### Misc
- Real audio playback (`audioplayers` not used)
- Backend / API calls (`http`, `dio` not used)
- Authentication logic (login = UI only)
- Push notifications
- Downloads / offline mode

---

## 5. Navigation Structure

`go_router` handles all routing. Shell route wraps bottom nav scaffold so `PlaybackBar` and bottom nav persist across tabs.

### Route Map

| Route | Screen |
|---|---|
| `/login` | Login / Signup |
| `/home` | Home |
| `/search` | Search grid |
| `/search/results?q=` | Search results |
| `/library` | Your Library |
| `/library/playlist/:id` | Playlist View |
| `/library/album/:id` | Album View |
| `/library/artist/:id` | Artist Page |
| `/premium` | Premium upsell |
| `/player` | Now Playing |

---

## 6. State Management

All mutable UI state in Riverpod providers. 

### Provider Table

| Provider | Type | Purpose |
|---|---|---|
| `nowPlayingProvider` | `StateNotifierProvider` | Current song, play/pause, progress |
| `searchQueryProvider` | `StateProvider<String>` | Active search text |
| `libraryProvider` | `StateNotifierProvider` | Saved playlists/albums/artists: supports add/remove |
| `selectedTabProvider` | `StateProvider<int>` | Active bottom nav tab |
| `currentPlaylistProvider` | `StateProvider<Playlist?>` | Playlist open in Playlist View |


### Provider Rules for New Devs
- **Read** providers with `ref.watch()` inside `ConsumerWidget`
- **Call methods** with `ref.read(provider.notifier).methodName()`
- **Never** create new providers without experienced dev review

---

## 7. Reusable Widget Inventory

All shared widgets live in `lib/widgets/`. No logic duplication across screens.

| Widget | Used In | Notes |
|---|---|---|
| `SongTile` | Playlist View - Now Playing - Search Results | Track number - title - artist - duration - overflow menu |
| `PlaybackBar` | All shell screens (persistent) | Mini player: art - title - play/pause - progress |
| `ArtistCard` | Home - Search - Artist Page | Circular image + name |
| `MixCard` / `AlbumCard` | Home - Library - Search | Square cover art + title + subtitle |
| `GenreChip` | Search grid | Colored rounded rect + label |
| `SectionHeader` | Home - Artist Page | Title + "See all" link row |
| `HorizontalScrollRow` | Home | Wraps any card list in horizontal `ListView` |
| `PlaybackControls` | Now Playing | Shuffle - prev - play/pause - next - repeat |
| `BottomNavBar` | Shell scaffold | Home - Search - Library tabs |

---

## 8. Mock Data Schema

All data is static Dart. Models in `lib/data/models/`. Data in `lib/data/mock_data.dart`.

### Models

```dart
// Song
id: String
title: String
artistId: String
albumId: String
duration: Duration
coverImg: String
trackNumber: int

// Artist
id: String
name: String
imageUrl: String
monthlyListeners: int
genres: List<String>
popularSongIds: List<String>
albumIds: List<String>

// Album
id: String
title: String
artistId: String
coverImg: String
releaseYear: int
songIds: List<String>

// Playlist
id: String
title: String
description: String
coverImg: String
songIds: List<String>
isUserCreated: bool

// NowPlaying (state, not stored)
song: Song
isPlaying: bool
progress: Duration
queue: List<Song>
```

### Relationships
- `Artist` > many `Album`, many `Song` (via `popularSongIds`)
- `Album` > belongs to `Artist`, many `Song`
- `Playlist` > many `Song` (cross-artist)
- `Song` > belongs to one `Artist`, one `Album`

---

## 9. Design

### Colors: `lib/theme/app_colors.dart`

| Name | Hex | Usage |
|---|---|---|
| `brandGreen` | `#1DB954` | Primary action - active state - brand accent |
| `background` | `#191414` | App background - scaffold |
| `surface` | `#282828` | Cards - bottom sheet - mini player - dialogs |
| `white` | `#FFFFFF` | Primary text - icons on dark |
| `subtleText` | `#535353` | Secondary/disabled text - metadata |
| `gray` | `#B3B3B3` | Inactive icons - placeholders - dividers |

> Never hardcode hex values outside `app_colors.dart`.

### Typography: `lib/theme/app_text_styles.dart`

| Style | Size | Weight | Usage |
|---|---|---|---|
| `displayLarge` | 32sp | Bold | Now Playing song title |
| `headlineMedium` | 24sp | Bold | Section headers - artist name |
| `titleMedium` | 16sp | SemiBold | Song title in tile - playlist title |
| `bodyMedium` | 14sp | Regular | Artist name - metadata - descriptions |
| `labelSmall` | 12sp | Regular | Duration - track number - chip labels |

---

## 12. Folder Structure

```
lib/
├── main.dart
├── router/
│   └── app_router.dart 
├── theme/
│   ├── app_colors.dart   
│   └── app_text_styles.dart  
├── data/
│   ├── models/
│   │   ├── song.dart
│   │   ├── artist.dart
│   │   ├── album.dart
│   │   ├── playlist.dart
│   │   └── now_playing.dart
│   └── mock_data.dart 
├── providers/
│   ├── now_playing_provider.dart
│   ├── library_provider.dart
│   └── search_provider.dart
├── screens/
│   ├── login/
│   ├── home/
│   ├── search/
│   ├── library/
│   ├── now_playing/
│   ├── playlist/
│   ├── album/
│   ├── artist/
│   └── premium/
└── widgets/
    ├── song_tile.dart
    ├── playback_bar.dart
    ├── artist_card.dart
    ├── mix_card.dart
    ├── genre_chip.dart
    ├── section_header.dart
    ├── horizontal_scroll_row.dart
    ├── playback_controls.dart
    └── bottom_nav_bar.dart
```
---

Will be using `flutter run -d windows` or `flutter run -d edge` in development