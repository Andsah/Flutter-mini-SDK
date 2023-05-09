import 'package:flutter/material.dart';

ColorScheme lightMode = ColorScheme(
    brightness: Brightness.light,
    background: const Color.fromARGB(255, 255, 255, 255),
    onBackground: Colors.grey.shade600,
    primary: Colors.indigo,
    onPrimary: const Color(0xFF8496FF),
    secondary: Colors.grey.shade400,
    onSecondary: Colors.grey.shade300,
    tertiary: Colors.grey,
    onTertiary: Colors.white,
    surface: const Color.fromARGB(255, 197, 197, 197),
    onSurface: const Color.fromARGB(255, 70, 70, 70),
    error: const Color.fromARGB(255, 255, 0, 0),
    onError: const Color.fromARGB(255, 255, 255, 255));

ColorScheme darkMode = ColorScheme(
    brightness: Brightness.dark,
   background: const Color.fromARGB(255, 32, 32, 32),
    onBackground: Colors.grey.shade500,
    primary: const Color.fromARGB(255, 4, 124, 78),
    onPrimary: const Color.fromARGB(255, 52, 233, 163),
    secondary: Colors.grey.shade300,
    onSecondary: Colors.grey.shade500,
    tertiary: Colors.grey.shade600,
    onTertiary: Colors.white,
    surface: const Color.fromARGB(255, 83, 83, 83),
    onSurface: const Color.fromARGB(255, 190, 190, 190),
    error: const Color.fromARGB(255, 255, 0, 0),
    onError: const Color.fromARGB(255, 255, 255, 255));