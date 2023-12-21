import 'package:bookstore/features/displaybooks/data/data_source/local/DAO/book_dao.dart';
import 'package:bookstore/features/displaybooks/data/models/Book.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [BookModel])
abstract class AppDataBase extends FloorDatabase {
  BookDao get bookDao;
}
