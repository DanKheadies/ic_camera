import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:ic_camera/widgets/widgets.dart';

class FrontCamera extends StatefulWidget {
  final CameraDescription camera;

  const FrontCamera({
    super.key,
    required this.camera,
  });

  @override
  State<FrontCamera> createState() => _FrontCameraState();
}

class _FrontCameraState extends State<FrontCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool isRecording = false;
  double guidePosition = 150;
  String guideShape = 'square';
  double guideSize = 200;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _controller.initialize();
    _controller.lockCaptureOrientation();
  }

  /* Error message below: */
  /* The selected imageFormatGroup is not supported by iOS. Defaulting to brga8888 */
  /* Error occurs b/c of something here  */

  void saveVideo() async {
    XFile videopath = await _controller.stopVideoRecording();
    setState(() {
      isRecording = false;
    });
    ImageGallerySaver.saveFile(videopath.path);
  }

  void recordVideo() async {
    await _controller.startVideoRecording();
    setState(() {
      isRecording = true;
    });
  }

  void moveToJackHandler() {
    if (guidePosition > 0) {
      print('side - towards jack');
      setState(() {
        guidePosition = guidePosition - 50;
      });
    }
  }

  void moveToCameraHandler() {
    if (guidePosition < 250) {
      print('side - towards camera');
      setState(() {
        guidePosition = guidePosition + 50;
      });
    }
  }

  void changeGuideHandler() {
    setState(() {
      if (guideSize == 200) {
        guideSize = 150;
      } else if (guideSize == 150) {
        guideSize = 100;
      } else if (guideSize == 100) {
        guideSize = 50;
      } else {
        guideSize = 200;
      }

      if (guideShape == 'square' && guideSize == 200) {
        guideShape = 'circle';
      } else if (guideShape == 'circle' && guideSize == 200) {
        guideShape = 'rectangle';
      } else if (guideShape == 'rectangle' && guideSize == 200) {
        guideShape = 'oval';
      } else if (guideShape == 'oval' && guideSize == 200) {
        guideShape = 'square';
      }
    });
    print('guide shape: ' + guideShape);
    print('guide size: ' + guideSize.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return Stack(
                children: [
                  CameraPreview(_controller),
                  RawMaterialButton(
                    child: Guide(
                      isRecording: isRecording,
                      guidePosition: guidePosition,
                      guideSize: guideSize,
                      guideShape: guideShape,
                    ),
                    onPressed: isRecording ? saveVideo : recordVideo,
                    onLongPress: isRecording ? saveVideo : () {},
                  ),
                  GuideButton(
                    guidePositionBottom: 25,
                    guideLeftSide: true,
                    guidePositionSide: 20,
                    guideIcon: Icons.align_vertical_bottom,
                    buttonHandler: moveToJackHandler,
                  ),
                  GuideButton(
                    guidePositionBottom: 25,
                    guideLeftSide: true,
                    guidePositionSide: 137.5,
                    guideIcon: Icons.change_circle_outlined,
                    buttonHandler: changeGuideHandler,
                  ),
                  GuideButton(
                    guidePositionBottom: 25,
                    guideLeftSide: false,
                    guidePositionSide: 20,
                    guideIcon: Icons.align_vertical_top,
                    buttonHandler: moveToCameraHandler,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
