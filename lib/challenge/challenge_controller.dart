//Precisa controlar o CurrentPage

import 'package:flutter/material.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  int qtdAwnsersRight = 0;
  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
}