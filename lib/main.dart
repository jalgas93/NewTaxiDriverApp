import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'helpers/app_colors.dart';
import 'modules/app/routing.dart';
//Библеотеку коментировал
import 'modules/app/routing.gr.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator(
        router: AppRouter(),
      ),
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.accent),
        backgroundColor: AppColors.background,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          backwardsCompatibility: false,
          elevation: 0.0,
          color: AppColors.appBar,
          iconTheme: IconThemeData(
            color: AppColors.appBarIcons,
            opacity: 1.0,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.appBarTitle,
            ),
          ),
        ),
        errorColor: AppColors.errors,
        unselectedWidgetColor: AppColors.unselectedWidget,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initialize().then((_) {
      setState(() {
        _initialized = true;
      });
    });
  }

  Future<void> initialize() async {
    // await ServiceLocator.setup();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
