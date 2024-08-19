import 'package:trackman_flutter_app1/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu = const <MenuModel>[
    MenuModel(icon: Icons.home, title: 'Dashboard'),
    MenuModel(icon: Icons.person, title: 'Profile'),
    MenuModel(icon: Icons.sports_golf, title: 'Drills'),
    MenuModel(icon: Icons.fitness_center, title: 'Exercises'),
    MenuModel(icon: Icons.golf_course, title: 'Competitions'),
    MenuModel(icon: Icons.logout, title: 'SignOut'),
  ];
}
