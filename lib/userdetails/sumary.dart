// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PieChartScreen extends StatefulWidget {
  double height;
  double width;
  final List<PieData> data;

  PieChartScreen({
    Key? key,
    this.height = 0,
    this.width = 0,
    required this.data,
  }) : super(key: key);

  @override
  State<PieChartScreen> createState() => _PieChartScreenState();
}

class _PieChartScreenState extends State<PieChartScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width == 0
            ? MediaQuery.of(context).size.width * 0.5
            : widget.width,
        height: widget.height == 0
            ? MediaQuery.of(context).size.height * 0.3
            : widget.height,
        child: CustomPaint(
          painter: PieChartPainter(widget.data),
        ),
      ),
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<PieData> data;

  PieChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final total = data.fold(0.0, (sum, entry) => sum + entry.value);

    double startAngle = 0.0;
    for (final entry in data) {
      final sweepAngle = 360.0 * entry.value / total;
      final paint = Paint()..color = entry.color;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        _degreesToRadians(startAngle),
        _degreesToRadians(sweepAngle),
        true,
        paint,
      );

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  double _degreesToRadians(double degrees) {
    return degrees * (3.14159 / 180.0);
  }
}

class PieData {
  final String accountName;
  final double value;
  final Color color;

  PieData(this.accountName, this.value, this.color);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pie Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PieChartScreen(
        data: [
          PieData('Conta 1', 30, Colors.red),
          PieData('Conta 2', 20, Colors.green),
          PieData('Conta 3', 50, Colors.blue),
        ],
      ),
    );
  }
}
