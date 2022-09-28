import 'package:flutter/material.dart';
import 'package:jista/data/constant/const_assets_images.dart';
import 'package:jista/views/splash/view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () => SplashViewModel.route(context));
  }

  @override
  Widget build(BuildContext context) {
    //SplashViewModel.route(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            image: const AssetImage(
              ConstAssetsImages.splashString,
            ),
            fit: BoxFit.cover,
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: const CircularProgressIndicator(
              color: Color.fromARGB(255, 228, 71, 60),
              backgroundColor: Color.fromARGB(255, 24, 97, 156),
            ),
          )
        ],
      ),
    );
  }
}
