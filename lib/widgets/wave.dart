import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:velocity_x/velocity_x.dart';

class Waves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  color: Color.fromARGB(129, 9, 9, 9),
                  height: 200,
                  width: 520,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipPath(
              clipper: WaveClipper1(),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  color: Colors.blue,
                  height: 220,
                  width: 510,
                ),
              ),
            ),
          ),
        ],
      ))
    ]);
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * -0.0331250, size.height * 1.0287123);
    path0.quadraticBezierTo(size.width * -0.0314167, size.height * 0.4955772,
        size.width * -0.0300333, size.height * 0.3180250);
    path0.cubicTo(
        size.width * 0.0336167,
        size.height * 0.5912413,
        size.width * 0.1543917,
        size.height * 0.6163718,
        size.width * 0.2322000,
        size.height * 0.6406613);
    path0.cubicTo(
        size.width * 0.3997333,
        size.height * 0.6797999,
        size.width * 0.5802083,
        size.height * 0.3154437,
        size.width * 0.7230250,
        size.height * 0.3283063);
    path0.cubicTo(
        size.width * 0.8420250,
        size.height * 0.3030018,
        size.width * 0.9577750,
        size.height * 0.5254931,
        size.width * 1.0542417,
        size.height * 0.4907193);
    path0.quadraticBezierTo(size.width * 1.0543917, size.height * 0.6257106,
        size.width * 1.0555333, size.height * 1.0330337);
    path0.lineTo(size.width * -0.0331250, size.height * 1.0287123);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * -0.0801667, size.height * 0.9989714);
    path0.quadraticBezierTo(size.width * -0.0826000, size.height * 0.5704143,
        size.width * -0.0817833, size.height * 0.4634429);
    path0.cubicTo(
        size.width * 0.0315917,
        size.height * 0.2840857,
        size.width * 0.1833667,
        size.height * 0.3341571,
        size.width * 0.2397000,
        size.height * 0.3933143);
    path0.cubicTo(
        size.width * 0.2994167,
        size.height * 0.4270571,
        size.width * 0.4117250,
        size.height * 0.5701000,
        size.width * 0.4707250,
        size.height * 0.6329714);
    path0.cubicTo(
        size.width * 0.5579833,
        size.height * 0.7368714,
        size.width * 0.6195417,
        size.height * 0.7410000,
        size.width * 0.7141000,
        size.height * 0.7507000);
    path0.quadraticBezierTo(size.width * 0.8835500, size.height * 0.7573286,
        size.width * 1.0420667, size.height * 0.4097000);
    path0.lineTo(size.width * 1.0419917, size.height * 1.0054286);
    path0.lineTo(size.width * -0.0801667, size.height * 0.9989714);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
