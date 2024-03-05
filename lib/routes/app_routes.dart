import 'package:get/get.dart';
import 'package:shop/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:shop/features/personalization/screens/settings/settings.dart';
import 'package:shop/routes/routes.dart';

import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/store/store.dart';
import '../features/shop/screens/wishlist/wishlist.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: ShopRoutes. home, page: () => const HomeScreen()),
    GetPage(name: ShopRoutes.store, page: () => const StoreScreen()),
    GetPage(name: ShopRoutes. favourites, page: () => const FavouriteScreen()),
    GetPage(name: ShopRoutes.settings, page: () => const SettingScreen()),
    GetPage(name: ShopRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ShopRoutes.order, page: () => const OrderScreen()),
    GetPage(name: ShopRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ShopRoutes.cart, page: () => const CartScreen()),
    GetPage(name: ShopRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: ShopRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: ShopRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: ShopRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: ShopRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: ShopRoutes.forgetPassword, page: () => const ForgotPassword()),
    GetPage(name: ShopRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
// Add more GetPage entries as needed
}
