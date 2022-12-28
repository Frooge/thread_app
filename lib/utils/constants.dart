// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static const double small_screen = 640;
  static const double medium_screen = 1008;

  static const double psize_1 = 8.0;
  static const double psize_2 = 16.0;
  static const double psize_3 = 24.0;

  static const EdgeInsets p_1 = EdgeInsets.all(psize_1);
  static const EdgeInsets p_2 = EdgeInsets.all(psize_2);
  static const EdgeInsets p_3 = EdgeInsets.all(psize_3);

  static const EdgeInsets pr_1 = EdgeInsets.only(right: psize_1);

  static const EdgeInsets pl_1 = EdgeInsets.only(left: psize_1);

  static const EdgeInsets plt_1 = EdgeInsets.only(top: psize_1, left: psize_1);

  static const EdgeInsets px_1 = EdgeInsets.only(left: psize_1, right: psize_1);
  static const EdgeInsets px_2 = EdgeInsets.only(left: psize_2, right: psize_2);
  static const EdgeInsets px_3 = EdgeInsets.only(left: psize_3, right: psize_3);

  static const EdgeInsets py_1 = EdgeInsets.only(top: psize_1, bottom: psize_1);
  static const EdgeInsets py_2 = EdgeInsets.only(top: psize_2, bottom: psize_2);

  static const EdgeInsets pt_1 = EdgeInsets.only(top: psize_1);
  static const EdgeInsets pt_2 = EdgeInsets.only(top: psize_2);

  static const EdgeInsets pb_1 = EdgeInsets.only(bottom: psize_1);
  static const EdgeInsets pb_2 = EdgeInsets.only(bottom: psize_2);

  static const double h_1 = 24;
  static const double h_2 = 18;
  static const double h_3 = 16;

  static const double avatar_size = 70;
  static const double avatar_chat_size = 60;

  static const double emote_size = 30;

  static const Color color_grey = Color.fromARGB(255, 158, 158, 158);
  static const Color color_light_grey = Color.fromARGB(255, 204, 204, 204);
}