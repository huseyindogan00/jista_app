import 'package:flutter/material.dart';
import 'package:jista/constant/const_assets_images.dart';
import 'package:jista/views/splash/vm/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewModel.route(context);

    return Scaffold(
      body: Center(
        child: Stack(
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
      ),
    );
  }
}
