part of 'local_bok_bloc.dart';

abstract class LocalBokEvent extends Equatable {
  final BookEntity? book;
  const LocalBokEvent({this.book});

  @override
  List<Object> get props => [book!];
}

class getSavedBooks extends LocalBokEvent {
  const getSavedBooks();
}

class removeBook extends LocalBokEvent {
  const removeBook(BookEntity book) : super(book: book);
}

class saveBook extends LocalBokEvent {
  const saveBook(BookEntity book) : super(book: book);
}
