import 'package:bookstore/features/displaybooks/data/data_source/local/app_database.dart';
import 'package:bookstore/features/displaybooks/data/data_source/remote/book_api_Service.dart';
import 'package:bookstore/features/displaybooks/data/repository/Book_Repository_Implementation.dart';
import 'package:bookstore/features/displaybooks/domain/repository/BookRepository.dart';
import 'package:bookstore/features/displaybooks/domain/usecases/getBookuseCase.dart';
import 'package:bookstore/features/displaybooks/domain/usecases/getSavedBooks.dart';
import 'package:bookstore/features/displaybooks/domain/usecases/saveBookUseCase.dart';
import 'package:bookstore/features/displaybooks/presentation/Blocs/bloc/remote_book_bloc.dart';
import 'package:bookstore/features/displaybooks/presentation/Blocs/local/bloc/local_bok_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/displaybooks/domain/usecases/removeBook.dart';

final sl = GetIt.instance;

Future<void> intializeDependencies() async {
  final database =
      await $FloorAppDataBase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDataBase>(database);
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<BookApiService>(BookApiService(sl()));
  sl.registerSingleton<BookRepository>(BookRepositoryImpl(sl(), sl()));
  sl.registerSingleton<GetBookUseCase>(GetBookUseCase(sl()));

  sl.registerSingleton<SaveBookUseCase>(SaveBookUseCase(sl()));
  sl.registerSingleton<RemoveBookUseCase>(RemoveBookUseCase(sl()));
  sl.registerSingleton<GetSavedBookUseCase>(GetSavedBookUseCase(sl()));
  sl.registerFactory<RemoteBookBloc>(() => RemoteBookBloc(sl()));
  sl.registerFactory<LocalBokBloc>(() => LocalBokBloc(sl(), sl(), sl()));

  sl.registerSingleton<ScreenUtil>(ScreenUtil());

  await ScreenUtil.ensureScreenSize();
}
