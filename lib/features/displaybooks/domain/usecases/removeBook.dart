import 'package:bookstore/core/usecases/usecase.dart';
import 'package:bookstore/features/displaybooks/domain/repository/BookRepository.dart';

import '../entites/BookEntity.dart';

class RemoveBookUseCase implements Usecase<void, BookEntity> {
  final BookRepository _bookRepository;
  RemoveBookUseCase(this._bookRepository);
  @override
  Future<void> call({BookEntity? params}) {
    return _bookRepository.removeBook(params!);
  }
}
