import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width - size.width / 4, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({required this.shadow, required this.clipper, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowPainter(shadow: shadow, clipper: clipper),
      child: ClipPath(child: child, clipper:  clipper,),
    );
  }
}
class _ClipShadowPainter extends CustomPainter{
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  _ClipShadowPainter({
   required this.shadow, required this.clipper
});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath= clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}