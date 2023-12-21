import 'package:bookstore/features/displaybooks/domain/entites/BookEntity.dart';

import '../../../../core/resource/data_state.dart';

abstract class BookRepository {
  Future<DataState<List<BookEntity>>> GetBooksEntities();

  Future<List<BookEntity>> getsavedBooks();

  Future<void> saveBook(BookEntity book);
  Future<void> removeBook(BookEntity book);
}
