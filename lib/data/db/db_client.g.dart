// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_client.dart';

// ignore_for_file: type=lint
class $RepoEntityTable extends RepoEntity
    with TableInfo<$RepoEntityTable, RepoEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;

  $RepoEntityTable(this.attachedDatabase, [this._alias]);

  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _issuesMeta = const VerificationMeta('issues');
  @override
  late final GeneratedColumn<int> issues = GeneratedColumn<int>(
      'issues', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _watchersMeta =
      const VerificationMeta('watchers');
  @override
  late final GeneratedColumn<int> watchers = GeneratedColumn<int>(
      'watchers', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, issues, watchers, language];

  @override
  String get aliasedName => _alias ?? actualTableName;

  @override
  String get actualTableName => $name;
  static const String $name = 'repo_entity';

  @override
  VerificationContext validateIntegrity(Insertable<RepoEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('issues')) {
      context.handle(_issuesMeta,
          issues.isAcceptableOrUnknown(data['issues']!, _issuesMeta));
    } else if (isInserting) {
      context.missing(_issuesMeta);
    }
    if (data.containsKey('watchers')) {
      context.handle(_watchersMeta,
          watchers.isAcceptableOrUnknown(data['watchers']!, _watchersMeta));
    } else if (isInserting) {
      context.missing(_watchersMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  RepoEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RepoEntityData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      issues: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}issues'])!,
      watchers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}watchers'])!,
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
    );
  }

  @override
  $RepoEntityTable createAlias(String alias) {
    return $RepoEntityTable(attachedDatabase, alias);
  }
}

class RepoEntityData extends DataClass implements Insertable<RepoEntityData> {
  final int id;
  final String name;
  final String description;
  final int issues;
  final int watchers;
  final String language;

  const RepoEntityData(
      {required this.id,
      required this.name,
      required this.description,
      required this.issues,
      required this.watchers,
      required this.language});

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['issues'] = Variable<int>(issues);
    map['watchers'] = Variable<int>(watchers);
    map['language'] = Variable<String>(language);
    return map;
  }

  RepoEntityCompanion toCompanion(bool nullToAbsent) {
    return RepoEntityCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      issues: Value(issues),
      watchers: Value(watchers),
      language: Value(language),
    );
  }

  factory RepoEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RepoEntityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      issues: serializer.fromJson<int>(json['issues']),
      watchers: serializer.fromJson<int>(json['watchers']),
      language: serializer.fromJson<String>(json['language']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'issues': serializer.toJson<int>(issues),
      'watchers': serializer.toJson<int>(watchers),
      'language': serializer.toJson<String>(language),
    };
  }

  RepoEntityData copyWith(
          {int? id,
          String? name,
          String? description,
          int? issues,
          int? watchers,
          String? language}) =>
      RepoEntityData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        issues: issues ?? this.issues,
        watchers: watchers ?? this.watchers,
        language: language ?? this.language,
      );

  @override
  String toString() {
    return (StringBuffer('RepoEntityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('issues: $issues, ')
          ..write('watchers: $watchers, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, issues, watchers, language);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RepoEntityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.issues == this.issues &&
          other.watchers == this.watchers &&
          other.language == this.language);
}

class RepoEntityCompanion extends UpdateCompanion<RepoEntityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<int> issues;
  final Value<int> watchers;
  final Value<String> language;

  const RepoEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.issues = const Value.absent(),
    this.watchers = const Value.absent(),
    this.language = const Value.absent(),
  });

  RepoEntityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required int issues,
    required int watchers,
    required String language,
  })  : name = Value(name),
        description = Value(description),
        issues = Value(issues),
        watchers = Value(watchers),
        language = Value(language);

  static Insertable<RepoEntityData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? issues,
    Expression<int>? watchers,
    Expression<String>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (issues != null) 'issues': issues,
      if (watchers != null) 'watchers': watchers,
      if (language != null) 'language': language,
    });
  }

  RepoEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<int>? issues,
      Value<int>? watchers,
      Value<String>? language}) {
    return RepoEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      issues: issues ?? this.issues,
      watchers: watchers ?? this.watchers,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (issues.present) {
      map['issues'] = Variable<int>(issues.value);
    }
    if (watchers.present) {
      map['watchers'] = Variable<int>(watchers.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RepoEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('issues: $issues, ')
          ..write('watchers: $watchers, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

abstract class _$DbClient extends GeneratedDatabase {
  _$DbClient(QueryExecutor e) : super(e);
  late final $RepoEntityTable repoEntity = $RepoEntityTable(this);
  late final RepoDao repoDao = RepoDao(this as DbClient);

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [repoEntity];
}
