import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stacked/stacked.dart';
import 'package:latlong2/latlong.dart';

import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MapViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.updateRotateAngle,
          child: Text("${viewModel.rotateAngle}")),
        body: FlutterMap(
          options: MapOptions(
            center: const LatLng(-33.869637, 18.5107103),
            zoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.android.application',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: const LatLng(-33.869000, 18.5107103),
                  width: 80,
                  height: 80, 
                  builder: (BuildContext context) {
                    return const FlutterLogo();
                   },
                   rotate: true,
                   
                  
                
                ),
              ],
            ),
          ],
        ));
  }

  @override
  MapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MapViewModel();
}
