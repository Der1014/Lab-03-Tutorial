import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

/// Interactive controls bound to the ViewModel.
class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;
  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final current = viewModel.visitDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: current.isBefore(today) ? today : current,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
    );
    if (picked != null) viewModel.setVisitDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
              child: Text('Trip Preferences',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            // Visit date picker tile
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Cruise Date'),
              trailing: Text(viewModel.formattedDate,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              onTap: () => _pickDate(context),
            ),
            // Cruise package dropdown
            ListTile(
              leading: const Icon(Icons.directions_boat),
              title: const Text('Package'),
              trailing: DropdownButton<String>(
                value: viewModel.selectedPackage,
                underline: const SizedBox.shrink(),
                items: CruiseBookingViewModel.packages
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: viewModel.setPackage,
              ),
            ),
            // Dark mode switch
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              value: viewModel.isDarkMode,
              onChanged: viewModel.toggleDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}
