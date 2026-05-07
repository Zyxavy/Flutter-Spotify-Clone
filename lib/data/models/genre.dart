class Genre {
  const Genre({
    required this.label,
    this.isActive = false,
  });

  final String label;
  final bool isActive;
}
