import 'package:trackman_flutter_app1/model/metric_model.dart';

class MetricDetails {
  final metricData = const [
    MetricModel(
        icon: 'assets/icons/speed.png', value: "102 mph", title: "Driver Swing Speed"),
    MetricModel(
        icon: 'assets/icons/ftp.png', value: "-3.2 Degrees", title: "Face to Path"),
    MetricModel(
        icon: 'assets/icons/swing_path.png', value: "+3.8 Degrees", title: "Club Path"),
    MetricModel(
        icon: 'assets/icons/face_angle.png', value: "+0.6 Degrees", title: "Face Angle"),
    MetricModel(
        icon: 'assets/icons/attack_angle.png', value: "-5.3 Degrees", title: "Wedges Attack Angle"),
    MetricModel(
        icon: 'assets/icons/attack_angle.png', value: "-4.6 Degrees", title: "Irons Attack Angle"),
    MetricModel(
        icon: 'assets/icons/location.png', value: "-4 mm", title: "Strike Location - Horizontal"),
    MetricModel(
        icon: 'assets/icons/location.png', value: "-6 mm", title: "Strike Location - Vertical")
  ];
}
