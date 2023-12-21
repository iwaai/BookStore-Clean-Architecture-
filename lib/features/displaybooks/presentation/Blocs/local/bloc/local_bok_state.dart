part of 'local_bok_bloc.dart';

abstract class LocalBokState extends Equatable {
  final List<BookEntity>? books;
  const LocalBokState({this.books});

  @override
  List<Object> get props => [books!];
}

class localBookLoading extends LocalBokState {
  const localBookLoading();
}

class localbookDone extends LocalBokState {
  const localbookDone(List<BookEntity> books) : super(books: books);
}
