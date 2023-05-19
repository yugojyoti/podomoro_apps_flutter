import 'package:flutter/material.dart';
import 'package:podomoro_apps/provider_service/timer_provider.dart';
import 'package:provider/provider.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TimerProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.white,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
