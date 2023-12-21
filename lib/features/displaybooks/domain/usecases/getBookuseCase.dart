import 'package:bookstore/core/resource/data_state.dart';
import 'package:bookstore/core/usecases/usecase.dart';
import 'package:bookstore/features/displaybooks/domain/repository/BookRepository.dart';

import '../entites/BookEntity.dart';

class GetBookUseCase implements Usecase<DataState<List<BookEntity>>, void> {
  final BookRepository _bookRepository;
  GetBookUseCase(this._bookRepository);
  @override
  Future<DataState<List<BookEntity>>> call({void params}) {
    return _bookRepository.GetBooksEntities();
  }
}
