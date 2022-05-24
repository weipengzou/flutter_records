// part of './bottom_navbar.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:records/common/index.dart' show AppRoutes;
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
    path: AppRoutes.home,
    page: HomeScreen(),
  ),
  IconsType(
    icon: FontAwesomeIcons.magnifyingGlass,
    path: AppRoutes.search,
    page: const SearchScreen(),
  ),
  // IconsType(
  //   icon: FontAwesomeIcons.plus,
  //   path: AppRoutes.AddRecord,
  //   page: const AddRecordScreen(),
  // ),
  IconsType(
    icon: FontAwesomeIcons.solidMessage,
    path: AppRoutes.message,
    page: const MessageScreen(),
  ),
  IconsType(
    icon: FontAwesomeIcons.solidUser,
    path: AppRoutes.mine,
    page: const MineScreen(),
  ),
];
