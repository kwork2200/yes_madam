import 'package:get/get.dart';
import 'package:yes_madam/bindings/about_us/about_us_binding.dart';
import 'package:yes_madam/bindings/account/account_binding.dart';
import 'package:yes_madam/bindings/address/add_address_binding.dart';
import 'package:yes_madam/bindings/bottom_nav/bottom_cart_widget.dart';
import 'package:yes_madam/bindings/bottom_nav/bottom_nav_bar_binding.dart';
import 'package:yes_madam/bindings/cart/cart_binding.dart';
import 'package:yes_madam/bindings/contact_us/contact_us_binding.dart';
import 'package:yes_madam/bindings/coupon/coupons_binding.dart';
import 'package:yes_madam/bindings/elite/elite_membership_binding.dart';
import 'package:yes_madam/bindings/home/home_binding.dart';
import 'package:yes_madam/bindings/location/location_binding.dart';
import 'package:yes_madam/bindings/login/login_binding.dart';
import 'package:yes_madam/bindings/notification/notifications_binding.dart';
import 'package:yes_madam/bindings/otp/otp_binding.dart';
import 'package:yes_madam/bindings/profile/profile_binding.dart';
import 'package:yes_madam/bindings/refer_earn/refer_earn_binding.dart';
import 'package:yes_madam/bindings/search/search_binding.dart';
import 'package:yes_madam/bindings/splash/splash_binding.dart';
import 'package:yes_madam/bindings/service_listing/service_listing_binding.dart';
import 'package:yes_madam/screens/about_us/about_us_screen.dart';
import 'package:yes_madam/screens/account/account_screen.dart';
import 'package:yes_madam/screens/address/add_address_screen.dart';
import 'package:yes_madam/screens/contact_us/contact_us_screen.dart';
import 'package:yes_madam/screens/coupon/coupons_screen.dart';
import 'package:yes_madam/screens/elite/elite_faqs_screen.dart';
import 'package:yes_madam/screens/elite/elite_membership_screen.dart';
import 'package:yes_madam/screens/home/home_screen.dart';
import 'package:yes_madam/screens/login/login_screen.dart';
import 'package:yes_madam/screens/notifications/notifications_screen.dart';
import 'package:yes_madam/screens/otp/otp_screen.dart';
import 'package:yes_madam/screens/bottom_nav/bottom_nav_bar_screen.dart';
import 'package:yes_madam/screens/location/location_screen.dart';
import 'package:yes_madam/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:yes_madam/screens/profile/profile_screen.dart';
import 'package:yes_madam/screens/refer_earn/refer_earn_coins_screen.dart';
import 'package:yes_madam/screens/refer_earn/refer_earn_faq_screen.dart';
import 'package:yes_madam/screens/refer_earn/refer_earn_journey_screen.dart';
import 'package:yes_madam/screens/refer_earn/refer_earn_screen.dart';
import 'package:yes_madam/screens/search/search_screen.dart';
import 'package:yes_madam/screens/service_listing/service_listing_screen.dart';
import 'package:yes_madam/screens/splash/splash_screen.dart';
import 'package:yes_madam/screens/terms_condition/terms_condition_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.location,
      page: () => LocationScreen(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNavBar,
      page: () => BottomNavBarScreen(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: AppRoutes.account,
      page: () => AccountScreen(),
      binding: AccountBinding(),
    ),
    GetPage(name: AppRoutes.privacyPolicy, page: () => PrivacyPolicyScreen()),
    GetPage(
      name: AppRoutes.termsConditions,
      page: () => TermsConditionScreen(),
    ),
    GetPage(
      name: AppRoutes.contactUs,
      page: () => ContactUsScreen(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationsScreen(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => AboutUsScreen(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => SearchScreen(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.eliteMembership,
      page: () => EliteMembershipScreen(),
      binding: EliteMembershipBinding(),
    ),
    GetPage(
      name: AppRoutes.eliteFaqs,
      page: () => EliteFaqsScreen(),
      binding: EliteMembershipBinding(),
    ),
    GetPage(
      name: AppRoutes.addAddress,
      page: () => AddAddressScreen(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: AppRoutes.coupons,
      page: () => CouponsScreen(onApply: (String code) {}),
      binding: CouponsBinding(),
    ),
    GetPage(
      name: AppRoutes.serviceListing,
      page: () => ServiceListingScreen(),
      binding: ServiceListingBinding(),
    ),
    GetPage(
      name: AppRoutes.referEarn,
      page: () => ReferEarnScreen(),
      binding: ReferEarnBinding(),
    ),
    GetPage(
      name: AppRoutes.referEarnJourney,
      page: () => ReferEarnJourneyScreen(),
      binding: ReferEarnBinding(),
    ),
    GetPage(
      name: AppRoutes.referEarnCoins,
      page: () => ReferEarnCoinsScreen(),
      binding: ReferEarnBinding(),
    ),
    GetPage(
      name: AppRoutes.referEarnFaq,
      page: () => ReferEarnFaqScreen(),
      binding: ReferEarnBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => BottomCartWidget(),
      binding: CartBinding(),
    ),
  ];
}
