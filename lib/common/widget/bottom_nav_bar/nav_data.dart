import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:records/common/routes/app_page.dart';
import 'package:records/screen/index.dart';

class IconsType {
  final IconData icon;
  final String path;
  final Widget page;
  IconsType({
    required this.icon,
    required this.path,
    required this.page,
  });
}

final List<IconsType> icons = [
  IconsType(
    icon: FontAwesomeIcons.house,
    path: AppRoutes.Home,
    page: const HomeScreen(),
  ),
  IconsType(
    icon: FontAwesomeIcons.magnifyingGlass,
    path: AppRoutes.Search,
    page: const SearchScreen(),
  ),
  // IconsType(
  //   icon: FontAwesomeIcons.plus,
  //   path: AppRoutes.AddRecord,
  //   page: const AddRecordScreen(),
  // ),
  IconsType(
    icon: FontAwesomeIcons.solidMessage,
    path: AppRoutes.Message,
    page: const MessageScreen(),
  ),
  IconsType(
    icon: FontAwesomeIcons.solidUser,
    path: AppRoutes.Mine,
    page: const MineScreen(),
  ),
];
