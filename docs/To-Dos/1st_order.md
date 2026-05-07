

**Order of attack:**

1. **Theme first** → colors/typography tokens. Everything depends on these.
2. **Mock data + models** → Song/Artist/Album/Playlist. Screens need data to render.
3. **Router skeleton** → all routes stubbed (empty screens). Nav works before UI built.
4. **Shell + BottomNav + PlaybackBar** → persistent chrome. Unblocks all tab screens.
5. **Shared widgets** → SongTile, MixCard, ArtistCard, GenreChip, SectionHeader. Build once, use everywhere.
6. **Screens** → Home → Search → Library → NowPlaying → Playlist → Artist → Premium → Login last.
7. **Riverpod providers** → wire state after screens render correctly.

---

**Folder structure** (per scope doc):
```
lib/
├── main.dart              ← wrap ProviderScope here
├── router/app_router.dart
├── theme/
│   ├── app_colors.dart
│   └── app_text_styles.dart
├── data/
│   ├── models/            ← Song, Artist, Album, Playlist, NowPlaying
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
│   ├── artist/
│   └── premium/
└── widgets/
    ├── song_tile.dart
    ├── playback_bar.dart
    ├── artist_card.dart
    ├── mix_card.dart
    ├── genre_chip.dart
    ├── section_header.dart
    └── playback_controls.dart
```

---

`ShellScaffold` = `Scaffold` with `BottomNavBar` + `PlaybackBar` + `child` in body.

---

**Priority kill order:**
```
theme → models → router+shell → widgets → screens → providers
```