import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_guardian/ui/theme/app_constants.dart';
import 'package:pet_guardian/ui/theme/theme.dart';
import 'package:pet_guardian/ui/view/screens/login/login_screen.dart';


class PetGuardianApp extends StatelessWidget {
  const PetGuardianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pet Guardian',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,


        primaryColor: AppColors.primaryColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(


              ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 8), () {
      Get.off(() => LoginScreen(), transition: Transition.fadeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimateGradient(
        primaryColors: const [
          AppColors.accentColor2,
          AppColors.accentColor1,
          AppColors.accentColor2
        ],
        secondaryColors: const [
          Colors.lightBlueAccent,
          Colors.lightBlue,
          Colors.blueAccent
        ],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 230.0),
              const Text(
                AppConstants.appName,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                    fontFamily: "IndieFlower",
                    color: Colors.white),
              ),
              Image.asset(
                AppConstants.splashScreenPath,
                width: 300,
                height: 225,
              ),
              const Text(
                AppConstants.phrase,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontFamily: "IndieFlower",
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60.0),
              const Text(
                AppConstants.developedBy,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
