import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : NavigateHomepageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NavBarPage()
              : NavigateHomepageWidget(),
        ),
        FFRoute(
            name: HomePageWidget.routeName,
            path: HomePageWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'HomePage')
                : NavBarPage(
                    initialPage: 'HomePage',
                    page: HomePageWidget(),
                  )),
        FFRoute(
          name: ProductDetailWidget.routeName,
          path: ProductDetailWidget.routePath,
          builder: (context, params) => ProductDetailWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
            name: CartWidget.routeName,
            path: CartWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Cart')
                : NavBarPage(
                    initialPage: 'Cart',
                    page: CartWidget(),
                  )),
        FFRoute(
          name: CheckoutWidget.routeName,
          path: CheckoutWidget.routePath,
          builder: (context, params) => CheckoutWidget(),
        ),
        FFRoute(
          name: SearchWidget.routeName,
          path: SearchWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'search')
              : SearchWidget(),
        ),
        FFRoute(
          name: CategoryWidget.routeName,
          path: CategoryWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Category')
              : CategoryWidget(),
        ),
        FFRoute(
          name: MypageWidget.routeName,
          path: MypageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Mypage')
              : MypageWidget(),
        ),
        FFRoute(
            name: ProductListCategoryWidget.routeName,
            path: ProductListCategoryWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ProductListCategoryWidget(
                    maincategory: params.getParam(
                      'maincategory',
                      ParamType.String,
                    ),
                    subcategory: params.getParam(
                      'subcategory',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
            name: ManageInformationWidget.routeName,
            path: ManageInformationWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ManageInformationWidget(),
                )),
        FFRoute(
            name: ChangeMyInformationWidget.routeName,
            path: ChangeMyInformationWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ChangeMyInformationWidget(),
                )),
        FFRoute(
          name: AddressWidget.routeName,
          path: AddressWidget.routePath,
          builder: (context, params) => AddressWidget(),
        ),
        FFRoute(
          name: SignUp1Widget.routeName,
          path: SignUp1Widget.routePath,
          builder: (context, params) => SignUp1Widget(
            userEmail: params.getParam(
              'userEmail',
              ParamType.String,
            ),
            userName: params.getParam(
              'userName',
              ParamType.String,
            ),
            method: params.getParam(
              'method',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SelectedAddressWidget.routeName,
          path: SelectedAddressWidget.routePath,
          builder: (context, params) => SelectedAddressWidget(),
        ),
        FFRoute(
          name: NavigateHomepageWidget.routeName,
          path: NavigateHomepageWidget.routePath,
          builder: (context, params) => NavigateHomepageWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: AddAddressWidget.routeName,
          path: AddAddressWidget.routePath,
          builder: (context, params) => AddAddressWidget(
            roadaddress: params.getParam(
              'roadaddress',
              ParamType.String,
            ),
            address: params.getParam(
              'address',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AddressRefreshWidget.routeName,
          path: AddressRefreshWidget.routePath,
          builder: (context, params) => AddressRefreshWidget(),
        ),
        FFRoute(
          name: EditAddressWidget.routeName,
          path: EditAddressWidget.routePath,
          asyncParams: {
            'addressToEdit':
                getDoc(['users', 'addresses'], AddressesRecord.fromSnapshot),
          },
          builder: (context, params) => EditAddressWidget(
            addressToEdit: params.getParam(
              'addressToEdit',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
            name: OrderDetailWidget.routeName,
            path: OrderDetailWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: OrderDetailWidget(
                    orderId: params.getParam(
                      'orderId',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: CartRefreshWidget.routeName,
          path: CartRefreshWidget.routePath,
          builder: (context, params) => CartRefreshWidget(),
        ),
        FFRoute(
            name: OrderListWidget.routeName,
            path: OrderListWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: OrderListWidget(),
                )),
        FFRoute(
          name: PaymentsuccessWidget.routeName,
          path: PaymentsuccessWidget.routePath,
          builder: (context, params) => PaymentsuccessWidget(
            orderId: params.getParam(
              'orderId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DeliverySearchWidget.routeName,
          path: DeliverySearchWidget.routePath,
          builder: (context, params) => DeliverySearchWidget(
            deliverycode: params.getParam(
              'deliverycode',
              ParamType.String,
            ),
            deliverynumber: params.getParam(
              'deliverynumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
            name: ProductListSearchWidget.routeName,
            path: ProductListSearchWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: ProductListSearchWidget(
                    searchword: params.getParam(
                      'searchword',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
            name: AllProductsWidget.routeName,
            path: AllProductsWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: AllProductsWidget(
                    option: params.getParam(
                      'option',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: ReviewWidget.routeName,
          path: ReviewWidget.routePath,
          builder: (context, params) => ReviewWidget(
            productId: params.getParam(
              'productId',
              ParamType.String,
            ),
            reviewId: params.getParam(
              'reviewId',
              ParamType.String,
            ),
            orderId: params.getParam(
              'orderId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
            name: MarketingPushWidget.routeName,
            path: MarketingPushWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: MarketingPushWidget(),
                )),
        FFRoute(
          name: Checkout2Widget.routeName,
          path: Checkout2Widget.routePath,
          builder: (context, params) => Checkout2Widget(
            checkoutUrl: params.getParam(
              'checkoutUrl',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
            name: LanguageWidget.routeName,
            path: LanguageWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: LanguageWidget(),
                )),
        FFRoute(
          name: TermWidget.routeName,
          path: TermWidget.routePath,
          builder: (context, params) => TermWidget(),
        ),
        FFRoute(
          name: PrivacyWidget.routeName,
          path: PrivacyWidget.routePath,
          builder: (context, params) => PrivacyWidget(),
        ),
        FFRoute(
          name: ReviewlistWidget.routeName,
          path: ReviewlistWidget.routePath,
          builder: (context, params) => ReviewlistWidget(
            productRef: params.getParam(
              'productRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: MyReviewsWidget.routeName,
          path: MyReviewsWidget.routePath,
          builder: (context, params) => MyReviewsWidget(),
        ),
        FFRoute(
          name: NavigateMyReviewsWidget.routeName,
          path: NavigateMyReviewsWidget.routePath,
          builder: (context, params) => NavigateMyReviewsWidget(),
        ),
        FFRoute(
          name: OrderCancelWidget.routeName,
          path: OrderCancelWidget.routePath,
          builder: (context, params) => OrderCancelWidget(
            orderId: params.getParam(
              'orderId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CouponListWidget.routeName,
          path: CouponListWidget.routePath,
          builder: (context, params) => CouponListWidget(),
        ),
        FFRoute(
          name: MypointWidget.routeName,
          path: MypointWidget.routePath,
          builder: (context, params) => MypointWidget(),
        ),
        FFRoute(
          name: HalalCertWidget.routeName,
          path: HalalCertWidget.routePath,
          builder: (context, params) => HalalCertWidget(
            certNo: params.getParam(
              'certNo',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: DeliverypolicyWidget.routeName,
          path: DeliverypolicyWidget.routePath,
          builder: (context, params) => DeliverypolicyWidget(),
        ),
        FFRoute(
          name: HalalRestaurantMapWidget.routeName,
          path: HalalRestaurantMapWidget.routePath,
          builder: (context, params) => HalalRestaurantMapWidget(),
        ),
        FFRoute(
          name: AddHalalRestaurantWidget.routeName,
          path: AddHalalRestaurantWidget.routePath,
          builder: (context, params) => AddHalalRestaurantWidget(
            place: params.getParam(
              'place',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
            name: HalalRestaurantSearchWidget.routeName,
            path: HalalRestaurantSearchWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: HalalRestaurantSearchWidget(),
                )),
        FFRoute(
            name: HalalRestaurantListWidget.routeName,
            path: HalalRestaurantListWidget.routePath,
            builder: (context, params) => NavBarPage(
                  initialPage: '',
                  page: HalalRestaurantListWidget(
                    regiongroup: params.getParam(
                      'regiongroup',
                      ParamType.String,
                    ),
                    regiondetail: params.getParam(
                      'regiondetail',
                      ParamType.String,
                    ),
                  ),
                )),
        FFRoute(
          name: HalalRestaurantWidget.routeName,
          path: HalalRestaurantWidget.routePath,
          builder: (context, params) => HalalRestaurantWidget(
            halalrestaurant: params.getParam(
              'halalrestaurant',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['HalalMap'],
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/navigateHomepage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/images/__(1024_x_500_px)-2.png',
                        fit: BoxFit.cover,
                      ),
                    )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
