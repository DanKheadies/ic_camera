import 'package:flutter/material.dart';

class GuideButton extends StatelessWidget {
  final double guidePositionBottom;
  final bool guideLeftSide;
  final double guidePositionSide;
  final IconData guideIcon;
  final VoidCallback buttonHandler;

  const GuideButton({
    super.key,
    required this.guidePositionBottom,
    required this.guideLeftSide,
    required this.guidePositionSide,
    required this.guideIcon,
    required this.buttonHandler,
  });

  Widget rawButton(
    VoidCallback buttonHandler,
    IconData guideIcon,
  ) =>
      RawMaterialButton(
        onPressed: buttonHandler,
        onLongPress: () {},
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Icon(
            guideIcon,
            color: Colors.white,
            size: 42,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (guideLeftSide) {
      return Positioned(
        bottom: guidePositionBottom,
        left: guidePositionSide,
        child: rawButton(
          buttonHandler,
          guideIcon,
        ),
      );
    } else {
      return Positioned(
        bottom: guidePositionBottom,
        right: guidePositionSide,
        child: rawButton(
          buttonHandler,
          guideIcon,
        ),
      );
    }
  }
}
