import 'package:flutter_svg/svg.dart';
import 'package:procuts_task/core/utils/svg_manager.dart';
import 'package:procuts_task/core/utils/values/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuts_task/features/products/presentation/screens/products_screen.dart';

import '../../../../config/locale/app_localizations.dart';
import '../../../../injection_container.dart';
import '/features/tabBar/presentation/cubit/tabbar_cubit/tabbar_cubit.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    //  FCMSettings fcmSettings = FCMSettings(context: context);
    //   fcmSettings.registerNotification();
    //   fcmSettings.initialize();
  }

  List<Widget> tabs = [
    const ProductsScreen(),
    const ProductsScreen(),
    const ProductsScreen(),
    const ProductsScreen(),
    const ProductsScreen(),
  ];
  // List<String> appBarTitles = [
  //   'orders',
  //   'categories',
  //   'products',
  //   'my_store',
  //   'my_store',
  // ];

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return BlocBuilder<TabbarCubit, TabbarState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.index == 0,
          onPopInvokedWithResult: (didPop, result) => _onWillPop,
          child: Scaffold(
            backgroundColor: colors.backGround,
            // appBar: AppBar(
            //   backgroundColor: colors.backGround,
            //   centerTitle: false,
            //   automaticallyImplyLeading: false,
            //   elevation: 0,
            //   title: Text(locale.text(appBarTitles[state.index]),
            //       style: TextStyles.bold20()),
            // ),
            body: PageStorage(
              bucket: bucket,
              child: tabs[state.index],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
              selectedLabelStyle: TextStyles.regular12(color: colors.main),
              unselectedLabelStyle:
                  TextStyles.regular12(color: colors.unselected),
              type: BottomNavigationBarType.fixed,
              onTap: (index) => onTapped(index),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(SvgAssets.homeIcon),
                  // activeIcon: Icon(
                  //   FontAwesomeIcons.bellConcierge,
                  //   color: colors.main,
                  // ),
                  label: locale.text('home'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(SvgAssets.heart),
                  // activeIcon: Icon(
                  //   Icons.grid_view_outlined,
                  //   color: colors.main,
                  // ),
                  label: locale.text('favorites'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(SvgAssets.cartIcon),
                  // activeIcon: Icon(
                  //   Icons.category_outlined,
                  //   color: colors.main,
                  // ),
                  label: locale.text('shopping_cart'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(SvgAssets.userIcon),
                  // activeIcon: Icon(
                  //   Icons.storefront_outlined,
                  //   color: colors.main,
                  // ),
                  label: locale.text('my_account'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(SvgAssets.moreIcon),
                  // activeIcon: Icon(
                  //   Icons.storefront_outlined,
                  //   color: colors.main,
                  // ),
                  label: locale.text('more'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _onWillPop(didPop) async {
    if (didPop) {
      await SystemNavigator.pop();
    } else {
      onTapped(0);
    }
  }

  void onTapped(int index) {
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      BlocProvider.of<TabbarCubit>(context).updateCurrentPage(index);
    });
  }
}
