import 'dart:io';
import 'package:bookstore/core/resource/data_state.dart';
import 'package:bookstore/features/displaybooks/data/data_source/local/app_database.dart';
import 'package:bookstore/features/displaybooks/data/models/Book.dart';
import 'package:bookstore/features/displaybooks/domain/entites/BookEntity.dart';
import '.././data_source/remote/book_api_Service.dart';
import '../../domain/repository/BookRepository.dart';
import 'package:dio/dio.dart';

class BookRepositoryImpl implements BookRepository {
  final BookApiService _bookapiService;
  final AppDataBase _appDataBase;
  BookRepositoryImpl(this._bookapiService, this._appDataBase);
  @override
  Future<DataState<List<BookModel>>> GetBooksEntities() async {
    try {
      final httpResponse = await _bookapiService.GetBooksEntity();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<BookModel>> getsavedBooks() {
    return _appDataBase.bookDao.getBooks();
  }

  @override
  Future<void> removeBook(BookEntity book) {
    return _appDataBase.bookDao.deleteBook(BookModel.fromEntity(book));
  }

  @override
  Future<void> saveBook(BookEntity book) {
    return _appDataBase.bookDao.insertBook(BookModel.fromEntity(book));
  }
}
