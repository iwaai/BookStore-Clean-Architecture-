import 'package:bookstore/core/usecases/usecase.dart';
import 'package:bookstore/features/displaybooks/domain/repository/BookRepository.dart';

import '../entites/BookEntity.dart';

class SaveBookUseCase implements Usecase<void, BookEntity> {
  final BookRepository _bookRepository;
  SaveBookUseCase(this._bookRepository);
  @override
  Future<void> call({BookEntity? params}) {
    return _bookRepository.saveBook(params!);
  }
}
