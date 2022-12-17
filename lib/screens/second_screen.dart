import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_app/business_logic/cubit/app_lang_cubit.dart';
import 'package:localization_app/localization/app_localization.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(AppLocalization.of(context)!.translate('AppName')),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              context.read<AppLangCubit>().setLang('ar');
            }, child:  Text("العربية",style: TextStyle(color: Theme.of(context).primaryColor),)),
             TextButton(onPressed: (){
              context.read<AppLangCubit>().setLang('en');
             }, child: Text("English",style: TextStyle(color: Theme.of(context).primaryColor),)),
          ],
        ),
      ),
    );
  }
}
