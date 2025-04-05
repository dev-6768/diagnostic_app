// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:diagnostic_app/data/model/view_cart_model.dart' as _i8;
import 'package:diagnostic_app/features/cart/view/cart_page.dart' as _i1;
import 'package:diagnostic_app/features/contact_details/view/contact_details_page.dart'
    as _i2;
import 'package:diagnostic_app/features/counter/view/counter_page.dart'
    deferred as _i3;
import 'package:diagnostic_app/features/home/view/home_page.dart' as _i4;
import 'package:diagnostic_app/features/terms_and_conditions/view/terms_and_conditions_page.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.CartPage]
class CartRoute extends _i6.PageRouteInfo<CartRouteArgs> {
  CartRoute({
    _i7.Key? key,
    required List<_i8.CartData> cartItems,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         CartRoute.name,
         args: CartRouteArgs(key: key, cartItems: cartItems),
         initialChildren: children,
       );

  static const String name = 'CartRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CartRouteArgs>();
      return _i1.CartPage(key: args.key, cartItems: args.cartItems);
    },
  );
}

class CartRouteArgs {
  const CartRouteArgs({this.key, required this.cartItems});

  final _i7.Key? key;

  final List<_i8.CartData> cartItems;

  @override
  String toString() {
    return 'CartRouteArgs{key: $key, cartItems: $cartItems}';
  }
}

/// generated route for
/// [_i2.ContactDetailsPage]
class ContactDetailsRoute extends _i6.PageRouteInfo<void> {
  const ContactDetailsRoute({List<_i6.PageRouteInfo>? children})
    : super(ContactDetailsRoute.name, initialChildren: children);

  static const String name = 'ContactDetailsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ContactDetailsPage();
    },
  );
}

/// generated route for
/// [_i3.CounterPage]
class CounterRoute extends _i6.PageRouteInfo<void> {
  const CounterRoute({List<_i6.PageRouteInfo>? children})
    : super(CounterRoute.name, initialChildren: children);

  static const String name = 'CounterRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return _i6.DeferredWidget(_i3.loadLibrary, () => _i3.CounterPage());
    },
  );
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomePage();
    },
  );
}

/// generated route for
/// [_i5.TermsAndConditionPage]
class TermsAndConditionRoute
    extends _i6.PageRouteInfo<TermsAndConditionRouteArgs> {
  TermsAndConditionRoute({
    _i7.Key? key,
    required String contentBody,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         TermsAndConditionRoute.name,
         args: TermsAndConditionRouteArgs(key: key, contentBody: contentBody),
         initialChildren: children,
       );

  static const String name = 'TermsAndConditionRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TermsAndConditionRouteArgs>();
      return _i5.TermsAndConditionPage(
        key: args.key,
        contentBody: args.contentBody,
      );
    },
  );
}

class TermsAndConditionRouteArgs {
  const TermsAndConditionRouteArgs({this.key, required this.contentBody});

  final _i7.Key? key;

  final String contentBody;

  @override
  String toString() {
    return 'TermsAndConditionRouteArgs{key: $key, contentBody: $contentBody}';
  }
}
