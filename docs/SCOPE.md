# Spotify Clone
> You are building screens. That's it. This doc tells you exactly what each screen looks like, what goes on it, and what widgets to use.

---

## Overview

UI only. No real music plays. No real login. Everything is fake data that we hardcode ourselves.

---

## Tasks

- **You do:** layout, widgets, making it look like the Figma design

> When in doubt, ask the baby.

---

## Screens to build

---

### 1. Login / Signup Screen

**What it is:** The first screen the user sees. Looks like Spotify's login page.

**What goes on it:**
- Spotify logo at the top
- Log in buttons that will route instantly

**Notes:**
- Buttons don't actually log in anyone. they just navigate to Home
- No validation needed

---

### 2. Home Screen

**What it is:** The main screen after login. Shows music recommendations.

**What goes on it:**
[placeholder]

**Notes:**
- Horizontal scrolling rows use `HorizontalScrollRow` widget
- Section titles use `SectionHeader` widget

---

### 3. Search Screen (Category Grid)

**What it is:** The search tab. Shows music categories as colored boxes.

**What goes on it:**
- Top bar with "Search" title
- Grid of colored category chips (e.g., Pop, Hip-Hop, Rock, )
- Each chip is a rounded rectangle with a color and label

**Notes:**
- Use `GenreChip` widget for each category box

---

### 4. Search Results Screen

**What it is:** Appears when user types in the search bar.

**What goes on it:**
- Search bar at top (active, with text cursor)
- **Recent Searches** section, simple list of past searches
- **Results** section, list of songs, artists, albums matching the search
- Each result row: thumbnail image + title + subtitle (artist name or type)

**Notes:**
- Use `SongTile` widget for song results
- Use `ArtistCard` widget for artist results

---

### 5. Your Library Screen

**What it is:** Shows everything the user has saved.

**What goes on it:**
- Top: filter chips, "Playlists" · "Albums" · "Artists" (like tabs)
- List of saved items below (each item: cover image + title + subtitle)
- "Create Playlist" button somewhere at the top or bottom

**Notes:**
- Use `MixCard` or list tiles for saved items

---

### 6. Playlist View Screen

**What it is:** Opens when user taps a playlist.

**What goes on it:**
[placeholder]

**Notes:**
- Use `SongTile` widget for each song in the list
- Header area scrolls with the content (not fixed)

---

### 7. Artist Page Screen

**What it is:** Opens when user taps an artist name.

**What goes on it:**
- Big artist photo at the top (hero image, full width)
- Artist name over the image
- **Popular** section, top 5 songs list
- **Discography** section, horizontal row of album cards
- **Related Artists** section, horizontal row of artist cards

**Notes:**
- Use `SongTile` for popular tracks
- Use `AlbumCard` for discography
- Use `ArtistCard` for related artists
- Use `SectionHeader` for each section title ("Popular", "Discography", etc.)

---

## Widgets You'll Use

> TO BE BUILT

| Widget | Looks Like | Use It For |
|---|---|---|
| `SongTile` | Song row with image, title, artist, duration | Any list of songs |
| `MixCard` | Square card with cover art + title | Playlists, albums in grids/rows |
| `ArtistCard` | Circle image + artist name below | Artist previews |
| `GenreChip` | Colored rounded box with text | Search category grid |
| `SectionHeader` | Bold title + "See all" on the right | Section titles like "Popular" |
| `HorizontalScrollRow` | Scrollable row container | Wrap any horizontal list |

---

## Images

- All images are screenshot images, no need to find real ones


---

## Colors to Use

> TO BE SET UP

| Color | What It Looks Like | Use For |
|---|---|---|
| `AppColors.brandGreen` | Spotify green | Play buttons, active states |
| `AppColors.background` | Very dark almost-black | App background |
| `AppColors.surface` | Dark gray | Cards, bottom sheets |
| `AppColors.white` | White | Main text, icons |
| `AppColors.gray` | Light gray | Secondary text, inactive icons |

---

## The Golden Rules

1. **Match the Figma.** If it's in the design, build it.
2. Remember. When in doubt, ask `The Baby`.