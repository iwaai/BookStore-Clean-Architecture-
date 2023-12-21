part of 'remote_book_bloc.dart';

sealed class RemoteBookEvent {
  const RemoteBookEvent();
}

class GetBooks extends RemoteBookEvent {
  const GetBooks();
}
