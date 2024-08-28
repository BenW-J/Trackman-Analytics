import 'dart:convert';

class Measurement {
  final String id;
  final String strokeId;
  final double teePositionX;
  final double teePositionY;
  final double teePositionZ;
  final String playerDexterity;
  final double dynamicLie;
  final double impactOffset;
  final double impactHeight;
  final double attackAngle;
  final double launchDirection;
  final double ballSpeed;
  final double clubPath;
  final double clubSpeed;
  final double dynamicLoft;
  final double faceAngle;
  final double faceToPath;
  final double launchAngle;
  final double smashFactor;
  final double spinAxis;
  final double spinLoft;
  final double spinRate;
  final double swingDirection;
  final double swingPlane;
  final double swingRadius;
  final double dplaneTilt;
  final double lowPointDistance;
  final double lowPointHeight;
  final double lowPointSide;
  final double maxHeight;
  final double carry;
  final double total;
  final double carrySide;
  final double totalSide;
  final double landingAngle;
  final double hangTime;
  final double lastData;
  final double curve;
  final List<String>? reducedAccuracy;
  final String ballTrajectory;
  final String clubTrajectory;

  Measurement({
    required this.id,
    required this.strokeId,
    required this.teePositionX,
    required this.teePositionY,
    required this.teePositionZ,
    required this.playerDexterity,
    required this.dynamicLie,
    required this.impactOffset,
    required this.impactHeight,
    required this.attackAngle,
    required this.launchDirection,
    required this.ballSpeed,
    required this.clubPath,
    required this.clubSpeed,
    required this.dynamicLoft,
    required this.faceAngle,
    required this.faceToPath,
    required this.launchAngle,
    required this.smashFactor,
    required this.spinAxis,
    required this.spinLoft,
    required this.spinRate,
    required this.swingDirection,
    required this.swingPlane,
    required this.swingRadius,
    required this.dplaneTilt,
    required this.lowPointDistance,
    required this.lowPointHeight,
    required this.lowPointSide,
    required this.maxHeight,
    required this.carry,
    required this.total,
    required this.carrySide,
    required this.totalSide,
    required this.landingAngle,
    required this.hangTime,
    required this.lastData,
    required this.curve,
    this.reducedAccuracy,
    required this.ballTrajectory,
    required this.clubTrajectory,
  });

  factory Measurement.fromJson(Map<String, dynamic> json, String strokeId) {
    return Measurement(
      id: json['Id'],
      strokeId: strokeId,
      teePositionX: (json['TeePosition'][0] as num).toDouble(),
      teePositionY: (json['TeePosition'][1] as num).toDouble(),
      teePositionZ: (json['TeePosition'][2] as num).toDouble(),
      playerDexterity: json['PlayerDexterity'],
      dynamicLie: (json['DynamicLie'] as num).toDouble(),
      impactOffset: (json['ImpactOffset'] as num).toDouble(),
      impactHeight: (json['ImpactHeight'] as num).toDouble(),
      attackAngle: (json['AttackAngle'] as num).toDouble(),
      launchDirection: (json['LaunchDirection'] as num).toDouble(),
      ballSpeed: (json['BallSpeed'] as num).toDouble(),
      clubPath: (json['ClubPath'] as num).toDouble(),
      clubSpeed: (json['ClubSpeed'] as num).toDouble(),
      dynamicLoft: (json['DynamicLoft'] as num).toDouble(),
      faceAngle: (json['FaceAngle'] as num).toDouble(),
      faceToPath: (json['FaceToPath'] as num).toDouble(),
      launchAngle: (json['LaunchAngle'] as num).toDouble(),
      smashFactor: (json['SmashFactor'] as num).toDouble(),
      spinAxis: (json['SpinAxis'] as num).toDouble(),
      spinLoft: (json['SpinLoft'] as num).toDouble(),
      spinRate: (json['SpinRate'] as num).toDouble(),
      swingDirection: (json['SwingDirection'] as num).toDouble(),
      swingPlane: (json['SwingPlane'] as num).toDouble(),
      swingRadius: (json['SwingRadius'] as num).toDouble(),
      dplaneTilt: (json['DPlaneTilt'] as num).toDouble(),
      lowPointDistance: (json['LowPointDistance'] as num).toDouble(),
      lowPointHeight: (json['LowPointHeight'] as num).toDouble(),
      lowPointSide: (json['LowPointSide'] as num).toDouble(),
      maxHeight: (json['MaxHeight'] as num).toDouble(),
      carry: (json['Carry'] as num).toDouble(),
      total: (json['Total'] as num).toDouble(),
      carrySide: (json['CarrySide'] as num).toDouble(),
      totalSide: (json['TotalSide'] as num).toDouble(),
      landingAngle: (json['LandingAngle'] as num).toDouble(),
      hangTime: (json['HangTime'] as num).toDouble(),
      lastData: (json['LastData'] as num).toDouble(),
      curve: (json['Curve'] as num).toDouble(),
      reducedAccuracy: (json['ReducedAccuracy'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      ballTrajectory: jsonEncode(json['BallTrajectory']),
      clubTrajectory: jsonEncode(json['ClubTrajectory']),
    );
  }

  List<String> toCsvRow() {
    return [
      id,
      strokeId,
      teePositionX.toString(),
      teePositionY.toString(),
      teePositionZ.toString(),
      playerDexterity,
      dynamicLie.toString(),
      impactOffset.toString(),
      impactHeight.toString(),
      attackAngle.toString(),
      launchDirection.toString(),
      ballSpeed.toString(),
      clubPath.toString(),
      clubSpeed.toString(),
      dynamicLoft.toString(),
      faceAngle.toString(),
      faceToPath.toString(),
      launchAngle.toString(),
      smashFactor.toString(),
      spinAxis.toString(),
      spinLoft.toString(),
      spinRate.toString(),
      swingDirection.toString(),
      swingPlane.toString(),
      swingRadius.toString(),
      dplaneTilt.toString(),
      lowPointDistance.toString(),
      lowPointHeight.toString(),
      lowPointSide.toString(),
      maxHeight.toString(),
      carry.toString(),
      total.toString(),
      carrySide.toString(),
      totalSide.toString(),
      landingAngle.toString(),
      hangTime.toString(),
      lastData.toString(),
      curve.toString(),
      reducedAccuracy != null ? reducedAccuracy!.join(',') : '',
      ballTrajectory,
      clubTrajectory,
    ];
  }

  static List<String> csvHeaders() {
    return [
      'id',
      'stroke_id',
      'tee_position_x',
      'tee_position_y',
      'tee_position_z',
      'player_dexterity',
      'dynamic_lie',
      'impact_offset',
      'impact_height',
      'attack_angle',
      'launch_direction',
      'ball_speed',
      'club_path',
      'club_speed',
      'dynamic_loft',
      'face_angle',
      'face_to_path',
      'launch_angle',
      'smash_factor',
      'spin_axis',
      'spin_loft',
      'spin_rate',
      'swing_direction',
      'swing_plane',
      'swing_radius',
      'dplane_tilt',
      'low_point_distance',
      'low_point_height',
      'low_point_side',
      'max_height',
      'carry',
      'total',
      'carry_side',
      'total_side',
      'landing_angle',
      'hang_time',
      'last_data',
      'curve',
      'reduced_accuracy',
      'ball_trajectory',
      'club_trajectory',
    ];
  }
}