part of 'remote_book_bloc.dart';

sealed class RemoteBookState extends Equatable {
  final List<BookEntity>? books;
  final DioException? error;
  const RemoteBookState({this.books, this.error});

  @override
  List<Object> get props => [books!, error!];
}

final class RemoteBooksLoading extends RemoteBookState {
  const RemoteBooksLoading();
}

final class RemoteBooksDone extends RemoteBookState {
  const RemoteBooksDone(List<BookEntity> books) : super(books: books);
}

final class RemoteBooksFailed extends RemoteBookState {
  const RemoteBooksFailed(DioException error) : super(error: error);
}
