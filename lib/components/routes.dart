import 'package:get/get.dart';

import '../pages/about_us_page.dart';
import '../pages/contact_us_page.dart';
import '../pages/language_change.dart';
import '../pages/my_home_page.dart';

final allRoutedPages = [
  GetPage(
    name: '/',
    page: () => const MyHomePage(),
  ),
  GetPage(
    name: '/about',
    page: () => const AboutUsPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/contact',
    page: () => const ContactUsPage(),
    transition: Transition.circularReveal,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/language',
    page: () => const LanguageChange(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
];
