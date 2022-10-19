import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/product_,item.dart';
import 'package:provider_project/product_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiProvider(
        
          providers: [
            ChangeNotifierProvider(create: (context) => ProductItem(0),)
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.lightGreen
            ),
            home: const ProductScreen(),
          ),
        );
      },
    );

  }
}

