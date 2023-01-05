import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
OpenScreen(BuildContext context, Widget screen) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
