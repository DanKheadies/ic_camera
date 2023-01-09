import 'package:flutter/material.dart';

import 'package:ic_camera/widgets/widgets.dart';

class Guide extends StatelessWidget {
  final bool isRecording;
  final double guidePosition;
  final double guideSize;
  final String guideShape;

  const Guide({
    super.key,
    required this.isRecording,
    required this.guidePosition,
    required this.guideSize,
    required this.guideShape,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0x11FFFFFF),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: !isRecording
          ? Container(
              padding: EdgeInsets.only(
                bottom: guidePosition > 0 ? guidePosition : 0,
              ),
              child: Center(
                child: guideShape == 'square' || guideShape == 'rectangle'
                    ? CustomPaint(
                        painter: BorderPainter(
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          width: guideShape == 'square'
                              ? guideSize
                              : guideSize / 2,
                          height: guideSize,
                          child: const Icon(
                            Icons.camera,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      )
                    : Container(
                        margin: guideShape == 'oval'
                            ? EdgeInsets.symmetric(
                                vertical: guideSize / 2,
                                horizontal: guideSize / 4,
                              )
                            : EdgeInsets.all(
                                guideSize == 200 ? 85 : guideSize / 2),
                        padding: guideShape == 'oval'
                            ? EdgeInsets.symmetric(
                                vertical: guideSize / 2,
                                horizontal: guideSize / 4,
                              )
                            : EdgeInsets.all(
                                guideSize == 200 ? 85 : guideSize / 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(guideSize),
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                        ),
                        child: const Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
              ),
            )
          : Container(
              padding: EdgeInsets.only(
                bottom: guidePosition > 0 ? guidePosition : 0,
              ),
              child: Center(
                child: guideShape == 'square' || guideShape == 'rectangle'
                    ? CustomPaint(
                        painter: BorderPainter(
                          color: Colors.red,
                        ),
                        child: SizedBox(
                          width: guideShape == 'square'
                              ? guideSize
                              : guideSize / 2,
                          height: guideSize,
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.red,
                            size: 28,
                          ),
                        ),
                      )
                    : Container(
                        margin: guideShape == 'oval'
                            ? EdgeInsets.symmetric(
                                vertical: guideSize / 2,
                                horizontal: guideSize / 4,
                              )
                            : EdgeInsets.all(
                                guideSize == 200 ? 85 : guideSize / 2),
                        padding: guideShape == 'oval'
                            ? EdgeInsets.symmetric(
                                vertical: guideSize / 2,
                                horizontal: guideSize / 4,
                              )
                            : EdgeInsets.all(
                                guideSize == 200 ? 85 : guideSize / 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(guideSize),
                          border: Border.all(
                            width: 3,
                            color: Colors.red,
                          ),
                        ),
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.red,
                          size: 28,
                        ),
                      ),
              ),
            ),
    );
  }
}
