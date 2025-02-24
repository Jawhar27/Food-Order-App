import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/config/app_routes.dart';
import 'package:food_order_app/providers/food_data_provider.dart';
import 'package:food_order_app/screens/menu_item_screen.dart';
import 'package:food_order_app/screens/menu_list_screen.dart';
import 'package:food_order_app/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FoodDataProvider(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 816),
          minTextAdapt: true,
          splitScreenMode: true,
        child: MaterialApp(
          title: 'Food Ordering App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MenuListScreen(),
          onGenerateRoute: OnRouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
