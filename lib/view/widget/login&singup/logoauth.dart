import 'package:flutter/cupertino.dart';
import 'package:universityservices/core/constant/imgaeasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImaeAsset.logo,
      height: 300,
    );
  }
}
