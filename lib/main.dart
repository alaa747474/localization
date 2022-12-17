import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_app/business_logic/cubit/app_lang_cubit.dart';
import 'package:localization_app/localization/app_localization.dart';
import 'package:localization_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppLangCubit>(
      create: (context) => AppLangCubit()..savedLang(),
      child: BlocBuilder<AppLangCubit, AppLangState>(
        builder: (context, state) {
          if (state is LangState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              locale: state.locale,
              supportedLocales: const [Locale('en'), Locale('ar')],
              localizationsDelegates: [
                AppLocalization.delgate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              localeResolutionCallback: (deviceLocal, supportedLocales) {
                for (var supportedLocal in supportedLocales) {
                  if (deviceLocal != null &&
                      deviceLocal.languageCode == supportedLocal.languageCode) {
                    return deviceLocal;
                  }
                }
                return supportedLocales.first;
              },
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: Colors.indigo,
                primarySwatch: Colors.blue,
              ),
              home: const HomeScreen(),
            );
          }
          return const MaterialApp(
            home: HomeScreen(),
            locale: Locale('en'),
          );
        },
      ),
    );
  }
}
