import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Main()),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({
    super.key,
  });

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(assetKey: 'shaders/some_shader.glsl',
        (context, shader, _) {
      return Center(
        child: SizedBox(
          width: 700,
          height: 700,
          child: CustomPaint(
            painter: Painter(
              shader: shader,
            ),
          ),
        ),
      );
    });
  }
}

class Painter extends CustomPainter {
  final FragmentShader shader;

  Painter({super.repaint, required this.shader});

  @override
  void paint(Canvas canvas, Size size) {
    List<double> triangles1 = [
      const Offset(0.0, 0.0),
      const Offset(0.5, 0.0),
      const Offset(0.5, 0.5),
      const Offset(0.0, 0.0),
      const Offset(0.0, 0.5),
      const Offset(0.5, 0.5), //
    ]
        .map((point) => point.withinSize(size))
        .expand((e) => e)
        .toList(growable: false);

    canvas.drawVertices(
      Vertices.raw(
        VertexMode.triangles,
        Float32List.fromList(triangles1),
        textureCoordinates: Float32List.fromList(triangles1),
      ),
      BlendMode.srcOver,
      Paint()
        ..shader = (shader
          ..setFloatUniforms(
            (u) => u.setSize(size),
          )),
    );

    List<double> triangles2 = [
      const Offset(0.5, 0.0),
      const Offset(1.0, 0.0),
      const Offset(1.0, 0.5),
      const Offset(0.5, 0.0),
      const Offset(0.5, 0.5),
      const Offset(1.0, 0.5), //
    ].map((point) => point.withinSize(size)).expand((e) => e).toList();

    canvas.drawVertices(
      Vertices.raw(
        VertexMode.triangles,
        Float32List.fromList(triangles2),
        textureCoordinates: Float32List.fromList(triangles2),
      ),
      BlendMode.srcOver,
      Paint()
        ..shader = (shader
          ..setFloatUniforms(
            (u) => u.setSize(size),
          )),
    );

    List<double> triangles3 = [
      const Offset(0.0, 0.5),
      const Offset(0.5, 0.5),
      const Offset(0.5, 1.0),
      const Offset(0.0, 0.5),
      const Offset(0.0, 1.0),
      const Offset(0.5, 1.0), //
    ].map((point) => point.withinSize(size)).expand((e) => e).toList();

    canvas.drawVertices(
      Vertices.raw(
        VertexMode.triangles,
        Float32List.fromList(triangles3),
        textureCoordinates: Float32List.fromList(triangles3),
      ),
      BlendMode.srcOver,
      Paint()
        ..shader = (shader
          ..setFloatUniforms(
            (u) => u.setSize(size),
          )),
    );

    List<double> triangles4 = [
      const Offset(0.5, 0.5),
      const Offset(1.0, 0.5),
      const Offset(1.0, 1.0),
      const Offset(0.5, 0.5),
      const Offset(0.5, 1.0),
      const Offset(1.0, 1.0), //
    ].map((point) => point.withinSize(size)).expand((e) => e).toList();

    canvas.drawVertices(
      Vertices.raw(
        VertexMode.triangles,
        Float32List.fromList(triangles4),
        textureCoordinates: Float32List.fromList(triangles4),
      ),
      BlendMode.srcOver,
      Paint()
        ..shader = (shader
          ..setFloatUniforms(
            (u) => u.setSize(size),
          )),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

extension on Offset {
  List<double> withinSize(Size size) {
    return [
      dx * size.width,
      dy * size.height,
    ];
  }
}
