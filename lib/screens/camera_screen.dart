import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ic_camera/providers/providers.dart';
import 'package:ic_camera/widgets/widgets.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future:
              Provider.of<Cameras>(context, listen: false).fetchAndSetCamera(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Consumer<Cameras>(
              child: const Icon(
                Icons.camera_alt,
              ),
              builder: (ctx, cameras, ch) => cameras.cameras.isEmpty
                  ? const SizedBox()
                  : FrontCamera(
                      camera: cameras.usedCamera,
                    ),
            );
          },
        ),
      ),
    );
  }
}
