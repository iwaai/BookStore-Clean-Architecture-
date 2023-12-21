import 'package:bookstore/core/usecases/usecase.dart';
import 'package:bookstore/features/displaybooks/domain/repository/BookRepository.dart';

import '../entites/BookEntity.dart';

class GetSavedBookUseCase implements Usecase<List<BookEntity>, void> {
  final BookRepository _bookRepository;
  GetSavedBookUseCase(this._bookRepository);
  @override
  Future<List<BookEntity>> call({void params}) {
    return _bookRepository.getsavedBooks();
  }
}
