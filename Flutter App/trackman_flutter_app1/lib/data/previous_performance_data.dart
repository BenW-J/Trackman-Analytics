import 'package:fl_chart/fl_chart.dart';

class HistoricalData {
  final spots = const [
    FlSpot(1.68, 45),
    FlSpot(2.84, 48),
    FlSpot(5.19, 55),
    FlSpot(6.01, 45),
    FlSpot(7.81, 58),
    FlSpot(9.49, 67),
    FlSpot(12.26, 70),
    FlSpot(30, 72),
    FlSpot(35, 75),
    FlSpot(38, 71),
    FlSpot(42, 68),
    FlSpot(55, 52),
    FlSpot(60, 55),
    FlSpot(62, 53),
    FlSpot(68, 70),
    FlSpot(70, 73),
    FlSpot(74, 72),
    FlSpot(81, 65),
    FlSpot(86, 70),
    FlSpot(90, 78),
    FlSpot(100, 77),
    FlSpot(105, 73),
    FlSpot(110, 77)
  ];

  final leftTitle = {
    0: '0',
    20: '20',
    40: '40',
    60: '60',
    80: '80',
    100: '100'
  };
  final bottomTitle = {
    0: 'Jan',
    10: 'Feb',
    20: 'Mar',
    30: 'Apr',
    40: 'May',
    50: 'Jun',
    60: 'Jul',
    70: 'Aug',
    80: 'Sep',
    90: 'Oct',
    100: 'Nov',
    110: 'Dec',
  };
}
