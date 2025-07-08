// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:diagnostic_app/data/model/view_cart_model.dart' as _i21;
import 'package:diagnostic_app/features/appointment_booking/view/appointment_booking_page.dart'
    as _i2;
import 'package:diagnostic_app/features/cart/view/cart_page.dart' as _i3;
import 'package:diagnostic_app/features/change_password/view/change_password_page.dart'
    as _i4;
import 'package:diagnostic_app/features/checkout/view/checkout_page.dart'
    as _i5;
import 'package:diagnostic_app/features/contact_details/view/contact_details_page.dart'
    as _i6;
import 'package:diagnostic_app/features/counter/view/counter_page.dart'
    deferred as _i7;
import 'package:diagnostic_app/features/edit_profile/view/edit_profile_page.dart'
    as _i16;
import 'package:diagnostic_app/features/forgot_password/view/forgot_password_page.dart'
    as _i8;
import 'package:diagnostic_app/features/home/view/home_page.dart' as _i9;
import 'package:diagnostic_app/features/login_page/view/login_page.dart'
    as _i10;
import 'package:diagnostic_app/features/navbar/view/navbar_page.dart' as _i11;
import 'package:diagnostic_app/features/order_reporting/view/order_reporting_page.dart'
    as _i12;
import 'package:diagnostic_app/features/order_tracking/view/order_tracking_page.dart'
    as _i13;
import 'package:diagnostic_app/features/orders/view/orders_page.dart' as _i14;
import 'package:diagnostic_app/features/pathology_test/view/pathology_test_page.dart'
    as _i15;
import 'package:diagnostic_app/features/signup_page/view/signup_page.dart'
    as _i17;
import 'package:diagnostic_app/features/status_screen/view/action_status_page.dart'
    as _i1;
import 'package:diagnostic_app/features/terms_and_conditions/view/terms_and_conditions_page.dart'
    as _i18;
import 'package:flutter/material.dart' as _i20;

/// generated route for
/// [_i1.ActionStatusPage]
class ActionStatusRoute extends _i19.PageRouteInfo<ActionStatusRouteArgs> {
  ActionStatusRoute({
    _i20.Key? key,
    bool isSuccess = true,
    String title = "Success",
    String message = "You have successfully completed this action.",
    List<_i19.PageRouteInfo>? children,
  }) : super(
         ActionStatusRoute.name,
         args: ActionStatusRouteArgs(
           key: key,
           isSuccess: isSuccess,
           title: title,
           message: message,
         ),
         initialChildren: children,
       );

  static const String name = 'ActionStatusRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActionStatusRouteArgs>(
        orElse: () => const ActionStatusRouteArgs(),
      );
      return _i1.ActionStatusPage(
        key: args.key,
        isSuccess: args.isSuccess,
        title: args.title,
        message: args.message,
      );
    },
  );
}

class ActionStatusRouteArgs {
  const ActionStatusRouteArgs({
    this.key,
    this.isSuccess = true,
    this.title = "Success",
    this.message = "You have successfully completed this action.",
  });

  final _i20.Key? key;

  final bool isSuccess;

  final String title;

  final String message;

  @override
  String toString() {
    return 'ActionStatusRouteArgs{key: $key, isSuccess: $isSuccess, title: $title, message: $message}';
  }
}

/// generated route for
/// [_i2.AppointmentBookingPage]
class AppointmentBookingRoute extends _i19.PageRouteInfo<void> {
  const AppointmentBookingRoute({List<_i19.PageRouteInfo>? children})
    : super(AppointmentBookingRoute.name, initialChildren: children);

  static const String name = 'AppointmentBookingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i2.AppointmentBookingPage();
    },
  );
}

/// generated route for
/// [_i3.CartPage]
class CartRoute extends _i19.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i20.Key? key,
    required List<_i21.CartData> cartItems,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         CartRoute.name,
         args: CartRouteArgs(key: key, cartItems: cartItems),
         initialChildren: children,
       );

  static const String name = 'CartRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CartRouteArgs>();
      return _i3.CartPage(key: args.key, cartItems: args.cartItems);
    },
  );
}

class CartRouteArgs {
  const CartRouteArgs({this.key, required this.cartItems});

  final _i20.Key? key;

  final List<_i21.CartData> cartItems;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, cartItems: $cartItems}';
  }
}

/// generated route for
/// [_i4.ChangePasswordPage]
class ChangePasswordRoute extends _i19.PageRouteInfo<void> {
  const ChangePasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i4.ChangePasswordPage();
    },
  );
}

/// generated route for
/// [_i5.CheckoutPage]
class CheckoutRoute extends _i19.PageRouteInfo<void> {
  const CheckoutRoute({List<_i19.PageRouteInfo>? children})
    : super(CheckoutRoute.name, initialChildren: children);

  static const String name = 'CheckoutRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i5.CheckoutPage();
    },
  );
}

/// generated route for
/// [_i6.ContactDetailsPage]
class ContactDetailsRoute extends _i19.PageRouteInfo<void> {
  const ContactDetailsRoute({List<_i19.PageRouteInfo>? children})
    : super(ContactDetailsRoute.name, initialChildren: children);

  static const String name = 'ContactDetailsRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i6.ContactDetailsPage();
    },
  );
}

/// generated route for
/// [_i7.CounterPage]
class CounterRoute extends _i19.PageRouteInfo<void> {
  const CounterRoute({List<_i19.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return _i19.DeferredWidget(_i7.loadLibrary, () => _i7.CounterPage());
    },
  );
}

/// generated route for
/// [_i8.ForgotPasswordPage]
class ForgotPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i19.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i8.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i9.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomePage();
    },
  );
}

/// generated route for
/// [_i10.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i20.Key? key,
    _i20.VoidCallback? onLoginSuccess,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         LoginRoute.name,
         args: LoginRouteArgs(key: key, onLoginSuccess: onLoginSuccess),
         initialChildren: children,
       );

  static const String name = 'LoginRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i10.LoginPage(key: args.key, onLoginSuccess: args.onLoginSuccess);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key, this.onLoginSuccess});

  final _i20.Key? key;

  final _i20.VoidCallback? onLoginSuccess;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}

/// generated route for
/// [_i11.NavbarPage]
class NavbarRoute extends _i19.PageRouteInfo<void> {
  const NavbarRoute({List<_i19.PageRouteInfo>? children})
    : super(NavbarRoute.name, initialChildren: children);

  static const String name = 'NavbarRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i11.NavbarPage();
    },
  );
}

/// generated route for
/// [_i12.OrderReportingPage]
class OrderReportingRoute extends _i19.PageRouteInfo<OrderReportingRouteArgs> {
  OrderReportingRoute({
    _i20.Key? key,
    required String orderId,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         OrderReportingRoute.name,
         args: OrderReportingRouteArgs(key: key, orderId: orderId),
         initialChildren: children,
       );

  static const String name = 'OrderReportingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderReportingRouteArgs>();
      return _i12.OrderReportingPage(key: args.key, orderId: args.orderId);
    },
  );
}

class OrderReportingRouteArgs {
  const OrderReportingRouteArgs({this.key, required this.orderId});

  final _i20.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderReportingRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i13.OrderTrackingPage]
class OrderTrackingRoute extends _i19.PageRouteInfo<OrderTrackingRouteArgs> {
  OrderTrackingRoute({
    _i20.Key? key,
    required String orderId,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         OrderTrackingRoute.name,
         args: OrderTrackingRouteArgs(key: key, orderId: orderId),
         initialChildren: children,
       );

  static const String name = 'OrderTrackingRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderTrackingRouteArgs>();
      return _i13.OrderTrackingPage(key: args.key, orderId: args.orderId);
    },
  );
}

class OrderTrackingRouteArgs {
  const OrderTrackingRouteArgs({this.key, required this.orderId});

  final _i20.Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderTrackingRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [_i14.OrdersPage]
class OrdersRoute extends _i19.PageRouteInfo<void> {
  const OrdersRoute({List<_i19.PageRouteInfo>? children})
    : super(OrdersRoute.name, initialChildren: children);

  static const String name = 'OrdersRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i14.OrdersPage();
    },
  );
}

/// generated route for
/// [_i15.PathologyTestPage]
class PathologyTestRoute extends _i19.PageRouteInfo<void> {
  const PathologyTestRoute({List<_i19.PageRouteInfo>? children})
    : super(PathologyTestRoute.name, initialChildren: children);

  static const String name = 'PathologyTestRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i15.PathologyTestPage();
    },
  );
}

/// generated route for
/// [_i16.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i16.ProfilePage();
    },
  );
}

/// generated route for
/// [_i17.SignupPage]
class SignupRoute extends _i19.PageRouteInfo<void> {
  const SignupRoute({List<_i19.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      return const _i17.SignupPage();
    },
  );
}

/// generated route for
/// [_i18.TermsAndConditionPage]
class TermsAndConditionRoute
    extends _i19.PageRouteInfo<TermsAndConditionRouteArgs> {
  TermsAndConditionRoute({
    _i20.Key? key,
    required String contentBody,
    List<_i19.PageRouteInfo>? children,
  }) : super(
         TermsAndConditionRoute.name,
         args: TermsAndConditionRouteArgs(key: key, contentBody: contentBody),
         initialChildren: children,
       );

  static const String name = 'TermsAndConditionRoute';

  static _i19.PageInfo page = _i19.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermsAndConditionRouteArgs>();
      return _i18.TermsAndConditionPage(
        key: args.key,
        contentBody: args.contentBody,
      );
    },
  );
}

class TermsAndConditionRouteArgs {
  const TermsAndConditionRouteArgs({this.key, required this.contentBody});

  final _i20.Key? key;

  final String contentBody;

  @override
  String toString() {
    return 'TermsAndConditionRouteArgs{key: $key, contentBody: $contentBody}';
  }
}
