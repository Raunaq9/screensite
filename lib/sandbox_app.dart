import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:providers/generic.dart';

import 'lists/list_details.dart';
import 'lists/list_info_details.dart';

class SandboxApp extends StatelessWidget {
  SandboxApp({Key? key}) : super(key: key);

  final SNP<Map<String, dynamic>?> _nsp = snp<Map<String, dynamic>?>(null);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [],
      child: MaterialApp(
        theme: ThemeData.light(), // darkTheme,
        darkTheme: ThemeData.dark(), // darkTheme,
        themeMode: ThemeMode.dark,
        title: "SANDBOX!",
        home: Scaffold(
            body: SizedBox(
                width: 800,
                height: 600,
                child: ListDetails('api.trade.gov', _nsp.notifier))),
      ),
    );
  }
}