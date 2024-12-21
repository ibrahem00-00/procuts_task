import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuts_task/core/utils/values/assets.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../cubit/auto_login/auto_login_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AutoLoginCubit>().getUserType();
  }

  void injectLocalizationAndColors() {
    // inject for once time
    try {
      // appLocalizations;
      colors;
    } catch (e) {
      // ServiceLocator.injectAppLocalizations(context: context);
      ServiceLocator.injectAppColors(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    injectLocalizationAndColors();
    log('Localizations: ${appLocalizations.locale?.languageCode}');
    return BlocListener<AutoLoginCubit, AutoLoginState>(
      listener: (context, state) {
        log('UserType: ${state.userType}');
        _goNext(state.userType);
      },
      child: SafeArea(
        child: Scaffold(
            body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.splash),
              fit: BoxFit.cover,
            ),
          ),
        )),
      ),
    );
  }

  _goNext(UserType userType) {
    Navigator.pushReplacementNamed(context, Routes.tabBarScreenRoute);
  }
}
