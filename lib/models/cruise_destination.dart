/// MODEL: pure data class, no Flutter imports, no logic.
class CruiseDestination {
  final String name;
  final String location;
  final String imageCaption;
  final String imageAsset;
  final String description;
  final int initialRating;

  const CruiseDestination({
    required this.name,
    required this.location,
    required this.imageCaption,
    required this.imageAsset,
    required this.description,
    required this.initialRating,
  });
}
