import 'package:bloc22/product_action_bloc.dart';
import 'package:bloc22/product_bloc.dart';
import 'package:bloc22/product_insert_bloc.dart';
import 'package:bloc22/signup_bloc.dart';
import 'package:bloc22/spalshscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loginbloc.dart';
import 'loginscreen.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider
      (providers:
    [
      BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
      BlocProvider<SignupBloc>(create: (_) => SignupBloc()),
      BlocProvider<ProductBloc>(create: (_) => ProductBloc()..add(FetchProducts())),
      BlocProvider<ProductInsertBloc>(create: (_) => ProductInsertBloc()),
      BlocProvider<ProductActionBloc>(create: (_) => ProductActionBloc()),
    ],
      child:MaterialApp(home:SplashScreen()),


    );
  }
}
