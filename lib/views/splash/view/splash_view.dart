import 'package:flutter/material.dart';
import 'package:jista/constant/const_assets_images.dart';
import 'package:jista/views/splash/vm/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;
    SplashViewModel.route(context);
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Stack(
            children: [
              Image(
                width: widthDevice,
                height: MediaQuery.of(context).size.height,
                image: const AssetImage(ConstAssetsImages.splashString),
                fit: BoxFit.cover,
              ),
              Positioned(
                top: heightDevice / 2,
                right: widthDevice / 2,
                child: const CircularProgressIndicator(semanticsLabel: 'Yükleniyor..'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
