import 'package:bloc/bloc.dart';
import 'package:bookstore/features/displaybooks/domain/entites/BookEntity.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/usecases/getSavedBooks.dart';
import '../../../../domain/usecases/removeBook.dart';
import '../../../../domain/usecases/saveBookUseCase.dart';

part 'local_bok_event.dart';
part 'local_bok_state.dart';

class LocalBokBloc extends Bloc<LocalBokEvent, LocalBokState> {
  final GetSavedBookUseCase _getSavedBookUseCase;
  final RemoveBookUseCase _removeBookUseCase;
  final SaveBookUseCase _saveBookUseCase;

  LocalBokBloc(
      this._getSavedBookUseCase, this._removeBookUseCase, this._saveBookUseCase)
      : super(const localBookLoading()) {
    on<getSavedBooks>(onGetsavedBooks);
    on<removeBook>(onRemoveBook);
    on<saveBook>(onSaveBook);
  }

  void onGetsavedBooks(getSavedBooks event, Emitter<LocalBokState> emit) async {
    final books = await _getSavedBookUseCase();
    emit(localbookDone(books));
  }

  void onRemoveBook(removeBook removebook, Emitter<LocalBokState> emit) async {
    await _removeBookUseCase(params: removebook.book);
    final books = await _getSavedBookUseCase();
    emit(localbookDone(books));
  }

  void onSaveBook(saveBook savebook, Emitter<LocalBokState> emit) async {
    try {
      print('before calling');
      await _saveBookUseCase(params: savebook.book);
      print('aftercalling');
      final books = await _getSavedBookUseCase();

      emit(localbookDone(books));
    } catch (e) {
      print(e);
    }
  }
}
