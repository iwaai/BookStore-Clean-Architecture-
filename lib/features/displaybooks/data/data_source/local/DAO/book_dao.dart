import 'package:bookstore/features/displaybooks/data/models/Book.dart';
import 'package:floor/floor.dart';

@dao
abstract class BookDao {
  @insert
  Future<void> insertBook(BookModel book);

  @delete
  Future<void> deleteBook(BookModel book);

  @Query('SELECT * FROM book')
  Future<List<BookModel>> getBooks();
}
