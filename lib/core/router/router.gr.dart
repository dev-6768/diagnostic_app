// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:diagnostic_app/data/model/view_cart_model.dart' as _i16;
import 'package:diagnostic_app/features/appointment_booking/view/appointment_booking_page.dart'
    as _i1;
import 'package:diagnostic_app/features/cart/view/cart_page.dart' as _i2;
import 'package:diagnostic_app/features/change_password/view/change_password_page.dart'
    as _i3;
import 'package:diagnostic_app/features/checkout/view/checkout_page.dart'
    as _i4;
import 'package:diagnostic_app/features/contact_details/view/contact_details_page.dart'
    as _i5;
import 'package:diagnostic_app/features/counter/view/counter_page.dart'
    deferred as _i6;
import 'package:diagnostic_app/features/forgot_password/view/forgot_password_page.dart'
    as _i7;
import 'package:diagnostic_app/features/home/view/home_page.dart' as _i8;
import 'package:diagnostic_app/features/login_page/view/login_page.dart' as _i9;
import 'package:diagnostic_app/features/navbar/view/navbar_page.dart' as _i10;
import 'package:diagnostic_app/features/pathology_test/view/pathology_test_page.dart'
    as _i11;
import 'package:diagnostic_app/features/signup_page/view/signup_page.dart'
    as _i12;
import 'package:diagnostic_app/features/terms_and_conditions/view/terms_and_conditions_page.dart'
    as _i13;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.AppointmentBookingPage]
class AppointmentBookingRoute extends _i14.PageRouteInfo<void> {
  const AppointmentBookingRoute({List<_i14.PageRouteInfo>? children})
    : super(AppointmentBookingRoute.name, initialChildren: children);

  static const String name = 'AppointmentBookingRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppointmentBookingPage();
    },
  );
}

/// generated route for
/// [_i2.CartPage]
class CartRoute extends _i14.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i15.Key? key,
    required List<_i16.CartData> cartItems,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         CartRoute.name,
         args: CartRouteArgs(key: key, cartItems: cartItems),
         initialChildren: children,
       );

  static const String name = 'CartRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CartRouteArgs>();
      return _i2.CartPage(key: args.key, cartItems: args.cartItems);
    },
  );
}

class CartRouteArgs {
  const CartRouteArgs({this.key, required this.cartItems});

  final _i15.Key? key;

  final List<_i16.CartData> cartItems;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, cartItems: $cartItems}';
  }
}

/// generated route for
/// [_i3.ChangePasswordPage]
class ChangePasswordRoute extends _i14.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i14.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i4.CheckoutPage]
class CheckoutRoute extends _i14.PageRouteInfo<void> {
  const CheckoutRoute({List<_i14.PageRouteInfo>? children})
    : super(CheckoutRoute.name, initialChildren: children);

  static const String name = 'CheckoutRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.CheckoutPage();
    },
  );
}

/// generated route for
/// [_i5.ContactDetailsPage]
class ContactDetailsRoute extends _i14.PageRouteInfo<void> {
  const ContactDetailsRoute({List<_i14.PageRouteInfo>? children})
    : super(ContactDetailsRoute.name, initialChildren: children);

  static const String name = 'ContactDetailsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.ContactDetailsPage();
    },
  );
}

/// generated route for
/// [_i6.CounterPage]
class CounterRoute extends _i14.PageRouteInfo<void> {
  const CounterRoute({List<_i14.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.DeferredWidget(_i6.loadLibrary, () => _i6.CounterPage());
    },
  );
}

/// generated route for
/// [_i7.ForgotPasswordPage]
class ForgotPasswordRoute extends _i14.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i14.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomePage();
    },
  );
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginPage();
    },
  );
}

/// generated route for
/// [_i10.NavbarPage]
class NavbarRoute extends _i14.PageRouteInfo<void> {
  const NavbarRoute({List<_i14.PageRouteInfo>? children})
    : super(NavbarRoute.name, initialChildren: children);

  static const String name = 'NavbarRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.NavbarPage();
    },
  );
}

/// generated route for
/// [_i11.PathologyTestPage]
class PathologyTestRoute extends _i14.PageRouteInfo<void> {
  const PathologyTestRoute({List<_i14.PageRouteInfo>? children})
    : super(PathologyTestRoute.name, initialChildren: children);

  static const String name = 'PathologyTestRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.PathologyTestPage();
    },
  );
}

/// generated route for
/// [_i12.SignupPage]
class SignupRoute extends _i14.PageRouteInfo<void> {
  const SignupRoute({List<_i14.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SignupPage();
    },
  );
}

/// generated route for
/// [_i13.TermsAndConditionPage]
class TermsAndConditionRoute
    extends _i14.PageRouteInfo<TermsAndConditionRouteArgs> {
  TermsAndConditionRoute({
    _i15.Key? key,
    required String contentBody,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         TermsAndConditionRoute.name,
         args: TermsAndConditionRouteArgs(key: key, contentBody: contentBody),
         initialChildren: children,
       );

  static const String name = 'TermsAndConditionRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermsAndConditionRouteArgs>();
      return _i13.TermsAndConditionPage(
        key: args.key,
        contentBody: args.contentBody,
      );
    },
  );
}

class TermsAndConditionRouteArgs {
  const TermsAndConditionRouteArgs({this.key, required this.contentBody});

  final _i15.Key? key;

  final String contentBody;

  @override
  String toString() {
    return 'TermsAndConditionRouteArgs{key: $key, contentBody: $contentBody}';
  }
}
