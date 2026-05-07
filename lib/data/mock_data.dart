import 'package:flutter/material.dart';

import '../data/models/artist.dart';
import '../data/models/genre.dart';
import '../data/models/mix.dart';
import '../data/models/song.dart';

const topGenres = <Genre>[
  Genre(label: 'All', isActive: true),
  Genre(label: 'Music'),
  Genre(label: 'Podcasts'),
];

const quickSongs = <Song>[
  Song(title: 'Daily Mix 1', accent: Color(0xFF1B5E20)),
  Song(title: 'Drake Radio', accent: Color(0xFF7B1FA2)),
  Song(title: 'R&B Classics 90s & 2000s - Best Old School...', accent: Color(0xFF8D6E63)),
  Song(title: 'This Is Bruno Mars', accent: Color(0xFFE65100), isMoreHighlighted: true),
  Song(title: 'Liked Songs', accent: Color(0xFF5E35B1)),
  Song(title: 'LANY', accent: Color(0xFF455A64)),
  Song(title: 'Daniel Caesar Radio', accent: Color(0xFF26A69A)),
  Song(title: 'Get Low', accent: Color(0xFF42A5F5)),
];

const jumpBackInMixes = <Mix>[
  Mix(title: 'OPM Mix', description: 'Khel Pangilinan, Skusta Clee, Ben&Ben and more', coverColor: Color(0xFF7B4A1A)),
  Mix(title: 'Panic! At The Disco', description: 'My Chemical Romance, Panic! At The Disco, Taylor Swift', coverColor: Color(0xFF8CEED3)),
  Mix(title: 'Taylor Swift', description: 'My Chemical Romance, Panic! At The Disco, Taylor Swift', coverColor: Color(0xFFA5F1D5)),
];

const similarToBrunoMixes = <Mix>[
  Mix(title: 'Bruno Mars', description: 'My Chemical Romance, Panic! At The Disco, Taylor Swift', coverColor: Color(0xFFA5E8CD)),
  Mix(title: 'Sing-along:90\'s to Now', description: 'My Chemical Romance, Panic! At The Disco, Taylor Swift', coverColor: Color(0xFF9AC5DC)),
  Mix(title: 'Top Viral\nThrowbacks', description: 'My Chemical Romance, Panic! At The Disco, Taylor Swift', coverColor: Color(0xFF2B0E24)),
];

const featuredArtists = <Artist>[
  Artist(name: 'Bruno Mars', description: 'Pop · Funk · Soul'),
  Artist(name: 'Daniel Caesar', description: 'R&B · Soul'),
  Artist(name: 'Taylor Swift', description: 'Pop · Country'),
];
