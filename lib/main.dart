import 'package:deal_mart/modules/check_out/check_out_screen.dart';
import 'package:deal_mart/modules/home/home_layout.dart';
import 'package:deal_mart/modules/map/adress_information.dart';
import 'package:deal_mart/shared/app_cubit/app_cubit.dart';
import 'package:deal_mart/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localization.dart';
import 'draft/alert_delete/alert_delete.dart';
import 'modules/cart/cart_screen.dart';
import 'modules/favourites/favourities_screen.dart';
import 'modules/map/address_screen.dart';
import 'modules/orders/order_placed_screen.dart';
import 'modules/settings/settings_screen.dart';
import 'modules/to_win/final_winner.dart';
import 'modules/to_win/winners_screen.dart';
import 'my_bloc_observer.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: primaryColor,
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: primaryColor,
                unselectedItemColor: textGray,
                elevation: 20,
                type: BottomNavigationBarType.fixed,
                backgroundColor: defTextColor,
              ),
            ),

            /// LOCALIZATION
            supportedLocales: const [

              Locale("en"),
              Locale("ar"),

            ],
            localizationsDelegates:
            [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,


            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode &&
                    supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },

            home://CartScreen()
            SettingsScreen(),
            //ScrollEnimationState(),
            //const OnBoardScreen(),
          );
        },
      ),
    );
    //     },
    //   ),
    // );
  }
}

