// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_harry_potter_characters_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorLocalHarryPotterCharactersDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalHarryPotterCharactersDatabaseBuilder databaseBuilder(
          String name) =>
      _$LocalHarryPotterCharactersDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$LocalHarryPotterCharactersDatabaseBuilder
      inMemoryDatabaseBuilder() =>
          _$LocalHarryPotterCharactersDatabaseBuilder(null);
}

class _$LocalHarryPotterCharactersDatabaseBuilder {
  _$LocalHarryPotterCharactersDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$LocalHarryPotterCharactersDatabaseBuilder addMigrations(
      List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$LocalHarryPotterCharactersDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<LocalHarryPotterCharactersDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$LocalHarryPotterCharactersDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$LocalHarryPotterCharactersDatabase
    extends LocalHarryPotterCharactersDatabase {
  _$LocalHarryPotterCharactersDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LocalHarryPotterCharactersDao? _daoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
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
            'CREATE TABLE IF NOT EXISTS `HarryPotterCharacter` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `species` TEXT NOT NULL, `gender` TEXT NOT NULL, `house` TEXT NOT NULL, `dateOfBirth` TEXT NOT NULL, `yearOfBirth` TEXT NOT NULL, `ancestry` TEXT NOT NULL, `eyeColour` TEXT NOT NULL, `hairColour` TEXT NOT NULL, `wandWood` TEXT NOT NULL, `wandCore` TEXT NOT NULL, `wandLength` REAL NOT NULL, `patronus` TEXT NOT NULL, `hogwartsStudent` INTEGER NOT NULL, `hogwartsStaff` INTEGER NOT NULL, `actor` TEXT NOT NULL, `alive` INTEGER NOT NULL, `image` TEXT NOT NULL, `favorite` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LocalHarryPotterCharactersDao get dao {
    return _daoInstance ??=
        _$LocalHarryPotterCharactersDao(database, changeListener);
  }
}

class _$LocalHarryPotterCharactersDao extends LocalHarryPotterCharactersDao {
  _$LocalHarryPotterCharactersDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _harryPotterCharacterInsertionAdapter = InsertionAdapter(
            database,
            'HarryPotterCharacter',
            (HarryPotterCharacter item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'species': item.species,
                  'gender': item.gender,
                  'house': item.house,
                  'dateOfBirth': item.dateOfBirth,
                  'yearOfBirth': item.yearOfBirth,
                  'ancestry': item.ancestry,
                  'eyeColour': item.eyeColour,
                  'hairColour': item.hairColour,
                  'wandWood': item.wandWood,
                  'wandCore': item.wandCore,
                  'wandLength': item.wandLength,
                  'patronus': item.patronus,
                  'hogwartsStudent': item.hogwartsStudent ? 1 : 0,
                  'hogwartsStaff': item.hogwartsStaff ? 1 : 0,
                  'actor': item.actor,
                  'alive': item.alive ? 1 : 0,
                  'image': item.image,
                  'favorite': item.favorite ? 1 : 0
                },
            changeListener),
        _harryPotterCharacterUpdateAdapter = UpdateAdapter(
            database,
            'HarryPotterCharacter',
            ['id'],
            (HarryPotterCharacter item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'species': item.species,
                  'gender': item.gender,
                  'house': item.house,
                  'dateOfBirth': item.dateOfBirth,
                  'yearOfBirth': item.yearOfBirth,
                  'ancestry': item.ancestry,
                  'eyeColour': item.eyeColour,
                  'hairColour': item.hairColour,
                  'wandWood': item.wandWood,
                  'wandCore': item.wandCore,
                  'wandLength': item.wandLength,
                  'patronus': item.patronus,
                  'hogwartsStudent': item.hogwartsStudent ? 1 : 0,
                  'hogwartsStaff': item.hogwartsStaff ? 1 : 0,
                  'actor': item.actor,
                  'alive': item.alive ? 1 : 0,
                  'image': item.image,
                  'favorite': item.favorite ? 1 : 0
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HarryPotterCharacter>
      _harryPotterCharacterInsertionAdapter;

  final UpdateAdapter<HarryPotterCharacter> _harryPotterCharacterUpdateAdapter;

  @override
  Future<List<HarryPotterCharacter>> getAllHarryPotterCharacters() async {
    return _queryAdapter.queryList('SELECT * FROM HarryPotterCharacter',
        mapper: (Map<String, Object?> row) => HarryPotterCharacter(
            id: row['id'] as int,
            name: row['name'] as String,
            species: row['species'] as String,
            gender: row['gender'] as String,
            house: row['house'] as String,
            dateOfBirth: row['dateOfBirth'] as String,
            yearOfBirth: row['yearOfBirth'] as String,
            ancestry: row['ancestry'] as String,
            eyeColour: row['eyeColour'] as String,
            hairColour: row['hairColour'] as String,
            wandWood: row['wandWood'] as String,
            wandCore: row['wandCore'] as String,
            wandLength: row['wandLength'] as double,
            patronus: row['patronus'] as String,
            hogwartsStudent: (row['hogwartsStudent'] as int) != 0,
            hogwartsStaff: (row['hogwartsStaff'] as int) != 0,
            actor: row['actor'] as String,
            alive: (row['alive'] as int) != 0,
            image: row['image'] as String,
            favorite: (row['favorite'] as int) != 0));
  }

  @override
  Stream<HarryPotterCharacter?> getHarryPotterCharacterById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM HarryPotterCharacter WHERE id = ?1',
        mapper: (Map<String, Object?> row) => HarryPotterCharacter(
            id: row['id'] as int,
            name: row['name'] as String,
            species: row['species'] as String,
            gender: row['gender'] as String,
            house: row['house'] as String,
            dateOfBirth: row['dateOfBirth'] as String,
            yearOfBirth: row['yearOfBirth'] as String,
            ancestry: row['ancestry'] as String,
            eyeColour: row['eyeColour'] as String,
            hairColour: row['hairColour'] as String,
            wandWood: row['wandWood'] as String,
            wandCore: row['wandCore'] as String,
            wandLength: row['wandLength'] as double,
            patronus: row['patronus'] as String,
            hogwartsStudent: (row['hogwartsStudent'] as int) != 0,
            hogwartsStaff: (row['hogwartsStaff'] as int) != 0,
            actor: row['actor'] as String,
            alive: (row['alive'] as int) != 0,
            image: row['image'] as String,
            favorite: (row['favorite'] as int) != 0),
        arguments: [id],
        queryableName: 'HarryPotterCharacter',
        isView: false);
  }

  @override
  Future<void> addHarryPotterCharacter(
      HarryPotterCharacter harryPotterCharacter) async {
    await _harryPotterCharacterInsertionAdapter.insert(
        harryPotterCharacter, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateHarryPotterCharacter(
      HarryPotterCharacter harryPotterCharacter) async {
    await _harryPotterCharacterUpdateAdapter.update(
        harryPotterCharacter, OnConflictStrategy.abort);
  }
}
