// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BookDao? _bookDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `book` (`kind` TEXT NOT NULL, `fullSortKey` TEXT NOT NULL, `title` TEXT NOT NULL, `url` TEXT NOT NULL, `coverColor` TEXT NOT NULL, `author` TEXT NOT NULL, `cover` TEXT NOT NULL, `epoch` TEXT NOT NULL, `href` TEXT NOT NULL, `hasAudio` INTEGER NOT NULL, `genre` TEXT NOT NULL, `simpleThumb` TEXT NOT NULL, `slug` TEXT NOT NULL, `coverThumb` TEXT NOT NULL, PRIMARY KEY (`fullSortKey`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BookDao get bookDao {
    return _bookDaoInstance ??= _$BookDao(database, changeListener);
  }
}

class _$BookDao extends BookDao {
  _$BookDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _bookModelInsertionAdapter = InsertionAdapter(
            database,
            'book',
            (BookModel item) => <String, Object?>{
                  'kind': item.kind,
                  'fullSortKey': item.fullSortKey,
                  'title': item.title,
                  'url': item.url,
                  'coverColor': item.coverColor,
                  'author': item.author,
                  'cover': item.cover,
                  'epoch': item.epoch,
                  'href': item.href,
                  'hasAudio': item.hasAudio ? 1 : 0,
                  'genre': item.genre,
                  'simpleThumb': item.simpleThumb,
                  'slug': item.slug,
                  'coverThumb': item.coverThumb
                }),
        _bookModelDeletionAdapter = DeletionAdapter(
            database,
            'book',
            ['fullSortKey'],
            (BookModel item) => <String, Object?>{
                  'kind': item.kind,
                  'fullSortKey': item.fullSortKey,
                  'title': item.title,
                  'url': item.url,
                  'coverColor': item.coverColor,
                  'author': item.author,
                  'cover': item.cover,
                  'epoch': item.epoch,
                  'href': item.href,
                  'hasAudio': item.hasAudio ? 1 : 0,
                  'genre': item.genre,
                  'simpleThumb': item.simpleThumb,
                  'slug': item.slug,
                  'coverThumb': item.coverThumb
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BookModel> _bookModelInsertionAdapter;

  final DeletionAdapter<BookModel> _bookModelDeletionAdapter;

  @override
  Future<List<BookModel>> getBooks() async {
    return _queryAdapter.queryList('SELECT * FROM book',
        mapper: (Map<String, Object?> row) => BookModel(
            kind: row['kind'] as String,
            fullSortKey: row['fullSortKey'] as String,
            title: row['title'] as String,
            url: row['url'] as String,
            coverColor: row['coverColor'] as String,
            author: row['author'] as String,
            cover: row['cover'] as String,
            epoch: row['epoch'] as String,
            href: row['href'] as String,
            hasAudio: (row['hasAudio'] as int) != 0,
            genre: row['genre'] as String,
            simpleThumb: row['simpleThumb'] as String,
            slug: row['slug'] as String,
            coverThumb: row['coverThumb'] as String));
  }

  @override
  Future<void> insertBook(BookModel book) async {
    await _bookModelInsertionAdapter.insert(book, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteBook(BookModel book) async {
    await _bookModelDeletionAdapter.delete(book);
  }
}
