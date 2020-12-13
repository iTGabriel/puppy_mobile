import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:puppy/providers/petshops.dart';
import 'package:puppy/screens/auth_screen.dart';
import 'package:puppy/screens/petshop_detail_screen.dart';
import 'package:puppy/screens/petshop_user_order_cardpayment.dart';
import 'package:puppy/screens/petshop_user_order_screen.dart';
import 'package:puppy/screens/petshop_user_order_success.dart';
import 'package:puppy/screens/petshop_user_order_transport.dart';
import 'package:puppy/screens/petshops_overview_screen.dart';
import 'package:puppy/utils/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Petshops()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: [
            Locale('en'),
            Locale('pt'),
          ],
          title: 'Puppy - PetPlatform',
          theme: ThemeData(
            primaryColor: Color.fromRGBO(0, 113, 188, 1),
          ),
          routes: {
            AppRoutes.HOME: (_) => AuthScreen(),
            AppRoutes.PETSHOPS: (_) => PetshopOverviewScreen(),
            AppRoutes.PETSHOP_DETAIL: (_) => PetshopDetailScreen(),
            AppRoutes.PETSHOP_USER_ORDER: (_) => PetshopUserOrderScreen(),
            AppRoutes.PETSHOP_USER_ORDER_TRANSPORT: (_) =>
                PethopUserOrderTransport(),
            AppRoutes.PETSHOP_USER_ORDER_TRANSPORT_PAYMENT: (_) =>
                PetshopUserOrderCardPayment(),
            AppRoutes.PETSHOP_USER_ORDER_TRANSPORT_PAYMENT_SUCCESS: (_) => PetshopUserOrderPaymentSuccess()
          },
        ));
  }
}
