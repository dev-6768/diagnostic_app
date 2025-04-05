// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:diagnostic_app/data/model/view_cart_model.dart' as _i10;
import 'package:diagnostic_app/features/cart/view/cart_page.dart' as _i1;
import 'package:diagnostic_app/features/contact_details/view/contact_details_page.dart'
    as _i2;
import 'package:diagnostic_app/features/counter/view/counter_page.dart'
    deferred as _i3;
import 'package:diagnostic_app/features/home/view/home_page.dart' as _i4;
import 'package:diagnostic_app/features/navbar/view/navbar_page.dart' as _i5;
import 'package:diagnostic_app/features/pathology_test/view/pathology_test_page.dart'
    as _i6;
import 'package:diagnostic_app/features/terms_and_conditions/view/terms_and_conditions_page.dart'
    as _i7;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i8.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i9.Key? key,
    required List<_i10.CartData> cartItems,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         CartRoute.name,
         args: CartRouteArgs(key: key, cartItems: cartItems),
         initialChildren: children,
       );

  static const String name = 'CartRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CartRouteArgs>();
      return _i1.CartPage(key: args.key, cartItems: args.cartItems);
    },
  );
}

class CartRouteArgs {
  const CartRouteArgs({this.key, required this.cartItems});

  final _i9.Key? key;

  final List<_i10.CartData> cartItems;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, cartItems: $cartItems}';
  }
}

/// generated route for
/// [_i2.ContactDetailsPage]
class ContactDetailsRoute extends _i8.PageRouteInfo<void> {
  const ContactDetailsRoute({List<_i8.PageRouteInfo>? children})
    : super(ContactDetailsRoute.name, initialChildren: children);

  static const String name = 'ContactDetailsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.ContactDetailsPage();
    },
  );
}

/// generated route for
/// [_i3.CounterPage]
class CounterRoute extends _i8.PageRouteInfo<void> {
  const CounterRoute({List<_i8.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return _i8.DeferredWidget(_i3.loadLibrary, () => _i3.CounterPage());
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.NavbarPage]
class NavbarRoute extends _i8.PageRouteInfo<void> {
  const NavbarRoute({List<_i8.PageRouteInfo>? children})
    : super(NavbarRoute.name, initialChildren: children);

  static const String name = 'NavbarRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.NavbarPage();
    },
  );
}

/// generated route for
/// [_i6.PathologyTestPage]
class PathologyTestRoute extends _i8.PageRouteInfo<void> {
  const PathologyTestRoute({List<_i8.PageRouteInfo>? children})
    : super(PathologyTestRoute.name, initialChildren: children);

  static const String name = 'PathologyTestRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.PathologyTestPage();
    },
  );
}

/// generated route for
/// [_i7.TermsAndConditionPage]
class TermsAndConditionRoute
    extends _i8.PageRouteInfo<TermsAndConditionRouteArgs> {
  TermsAndConditionRoute({
    _i9.Key? key,
    required String contentBody,
    List<_i8.PageRouteInfo>? children,
  }) : super(
         TermsAndConditionRoute.name,
         args: TermsAndConditionRouteArgs(key: key, contentBody: contentBody),
         initialChildren: children,
       );

  static const String name = 'TermsAndConditionRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermsAndConditionRouteArgs>();
      return _i7.TermsAndConditionPage(
        key: args.key,
        contentBody: args.contentBody,
      );
    },
  );
}

class TermsAndConditionRouteArgs {
  const TermsAndConditionRouteArgs({this.key, required this.contentBody});

  final _i9.Key? key;

  final String contentBody;

  @override
  String toString() {
    return 'TermsAndConditionRouteArgs{key: $key, contentBody: $contentBody}';
  }
}
