import 'package:bookstore/features/displaybooks/presentation/Blocs/bloc/remote_book_bloc.dart';
import 'package:bookstore/features/displaybooks/presentation/Blocs/local/bloc/local_bok_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/displaybooks/presentation/pages/home/HomePage.dart';
import 'injection_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/displaybooks/presentation/Blocs/Theme/themeCubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<RemoteBookBloc>(
              create: (context) => sl()..add(const GetBooks()),
            ),
            BlocProvider<AppthemeCubit>(
              create: (context) => AppthemeCubit()..init(),
            ),
            BlocProvider(
              create: (context) => sl<LocalBokBloc>(),
            )
          ],
          child: BlocBuilder<AppthemeCubit, bool>(
            builder: (context, state) {
              return MaterialApp(
                title: 'Flutter Demo',
                theme: state ? ThemeData.light() : ThemeData.dark(),
                home: const HomePage(),
              );
            },
          ));
    });
  }
}
