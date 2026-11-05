import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;
  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sibu River Cruise & Heritage')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Rebuild the content whenever the ViewModel changes.
          return ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) {
              final d = viewModel.destination;

              final header = HeaderImageWidget(
                assetPath: d.imageAsset,
                caption: d.imageCaption,
                height: orientation == Orientation.landscape ? 200 : 220,
              );
              final title = TitleSectionWidget(
                name: d.name,
                location: d.location,
                rating: viewModel.rating,
                onStarTap: viewModel.incrementRating,
              );
              const actions = ActionBarWidget();
              final description = DescriptionWidget(text: d.description);
              final controls = BookingControlsWidget(viewModel: viewModel);

              if (orientation == Orientation.landscape) {
                // Figure 2: side-by-side split pane.
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(children: [header, description]),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(
                      child: ListView(children: [title, actions, controls]),
                    ),
                  ],
                );
              }

              // Figure 1: single scrolling column.
              return ListView(
                children: [header, title, actions, description, controls],
              );
            },
          );
        },
      ),
    );
  }
}
