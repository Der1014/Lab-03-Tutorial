import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

/// VIEWMODEL: holds all UI state + business logic.
/// Views listen to it; it never touches widgets.
class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    imageCaption: 'Sibu Esplanade Landmark',
    imageAsset: 'assets/images/rajang.jpg',
    description:
        'Experience the heart of Sibu along Malaysia\'s longest river, the '
        'Rajang. Cruise past historic temples, timber hubs, and traditional '
        'waterfront settlements while experiencing authentic Sarawakian '
        'hospitality.',
    initialRating: 41,
  );

  static const List<String> packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  late int _rating = destination.initialRating;
  DateTime _visitDate = DateTime.now().add(const Duration(days: 10));
  String _selectedPackage = packages.first;
  bool _isDarkMode = false;

  int get rating => _rating;
  DateTime get visitDate => _visitDate;
  String get selectedPackage => _selectedPackage;
  bool get isDarkMode => _isDarkMode;

  String get formattedDate {
    final d = _visitDate;
    return '${d.day.toString().padLeft(2, '0')}/'
        '${d.month.toString().padLeft(2, '0')}/${d.year}';
  }

  void incrementRating() {
    _rating++;
    notifyListeners();
  }

  void setVisitDate(DateTime date) {
    _visitDate = date;
    notifyListeners();
  }

  void setPackage(String? value) {
    if (value == null) return;
    _selectedPackage = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
