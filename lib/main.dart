import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() => runApp(const RajangCruiseApp());

class RajangCruiseApp extends StatefulWidget {
  const RajangCruiseApp({super.key});

  @override
  State<RajangCruiseApp> createState() => _RajangCruiseAppState();
}

class _RajangCruiseAppState extends State<RajangCruiseApp> {
  // Created once so state survives rebuilds/rotation.
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) => MaterialApp(
        title: 'Rajang River Cruise',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: CruiseBookingScreen(viewModel: _viewModel),
      ),
    );
  }
}
