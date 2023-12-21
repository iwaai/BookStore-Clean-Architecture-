import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String kind;
  final String fullSortKey;
  final String title;
  final String url;
  final String coverColor;
  final String author;
  final String cover;
  final String epoch;
  final String href;
  final bool hasAudio;
  final String genre;
  final String simpleThumb;
  final String slug;
  final String coverThumb;
  //final dynamic liked;

  const BookEntity({
    required this.kind,
    required this.fullSortKey,
    required this.title,
    required this.url,
    required this.coverColor,
    required this.author,
    required this.cover,
    required this.epoch,
    required this.href,
    required this.hasAudio,
    required this.genre,
    required this.simpleThumb,
    required this.slug,
    required this.coverThumb,
    //required this.liked,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        kind,
        fullSortKey,
        title,
        url,
        coverColor,
        author,
        cover,
        epoch,
        href,
        genre,
        simpleThumb,
        slug,
        coverThumb,
        //liked
      ];
}
