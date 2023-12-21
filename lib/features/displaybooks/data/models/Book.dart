import 'package:bookstore/features/displaybooks/domain/entites/BookEntity.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'book', primaryKeys: ['fullSortKey'])
class BookModel extends BookEntity {
  const BookModel({
    required String kind,
    required String fullSortKey,
    required String title,
    required String url,
    required String coverColor,
    required String author,
    required String cover,
    required String epoch,
    required String href,
    required bool hasAudio,
    required String genre,
    required String simpleThumb,
    required String slug,
    required String coverThumb,
    //required dynamic liked,
  }) : super(
          kind: kind,
          fullSortKey: fullSortKey,
          title: title,
          url: url,
          coverColor: coverColor,
          author: author,
          cover: cover,
          epoch: epoch,
          href: href,
          hasAudio: hasAudio,
          genre: genre,
          simpleThumb: simpleThumb,
          slug: slug,
          coverThumb: coverThumb,
          //iked: liked
        );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        kind: json["kind"],
        fullSortKey: json["full_sort_key"],
        title: json["title"],
        url: json["url"],
        coverColor: json["cover_color"],
        author: json["author"],
        cover: json["cover"],
        epoch: json["epoch"],
        href: json["href"],
        hasAudio: json["has_audio"],
        genre: json["genre"],
        simpleThumb: json["simple_thumb"],
        slug: json["slug"],
        coverThumb: json["cover_thumb"],
        //liked: json["liked"],
      );

  factory BookModel.fromEntity(BookEntity entity) {
    return BookModel(
        kind: entity.kind,
        fullSortKey: entity.fullSortKey,
        title: entity.title,
        url: entity.url,
        coverColor: entity.coverColor,
        author: entity.author,
        cover: entity.cover,
        epoch: entity.epoch,
        href: entity.href,
        hasAudio: entity.hasAudio,
        genre: entity.genre,
        simpleThumb: entity.simpleThumb,
        slug: entity.slug,
        coverThumb: entity.coverThumb);
  }
}
