import 'package:flutter/material.dart';

import 'balances/balances_page.dart';

void main() {
  runApp(const App());
}

class App extends MaterialApp {
  const App({super.key}) : super(home: const BalancesPage());
}
