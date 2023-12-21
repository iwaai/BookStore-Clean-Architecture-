import 'package:bloc/bloc.dart';
import 'package:bookstore/core/resource/data_state.dart';
import 'package:bookstore/features/displaybooks/domain/entites/BookEntity.dart';
import 'package:bookstore/features/displaybooks/domain/usecases/getBookuseCase.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
part 'remote_book_event.dart';
part 'remote_book_state.dart';

class RemoteBookBloc extends Bloc<RemoteBookEvent, RemoteBookState> {
  final GetBookUseCase _getBookUseCase;

  RemoteBookBloc(this._getBookUseCase) : super(const RemoteBooksLoading()) {
    on<GetBooks>(OnGetBooks);
  }
  Future<void> OnGetBooks(GetBooks event, Emitter<RemoteBookState> emit) async {
    final dataState = await _getBookUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      //print(dataState.error!.message);
      print("data should be there");
      emit(RemoteBooksDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error!.message);
      emit(RemoteBooksFailed(dataState.error!));
    }
  }
}
