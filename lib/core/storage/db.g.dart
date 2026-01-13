// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $EntitlementsCacheTable extends EntitlementsCache
    with TableInfo<$EntitlementsCacheTable, EntitlementsCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EntitlementsCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _hasProMeta = const VerificationMeta('hasPro');
  @override
  late final GeneratedColumn<bool> hasPro = GeneratedColumn<bool>(
      'has_pro', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("has_pro" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _creditsMeta =
      const VerificationMeta('credits');
  @override
  late final GeneratedColumn<int> credits = GeneratedColumn<int>(
      'credits', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _expiresAtMeta =
      const VerificationMeta('expiresAt');
  @override
  late final GeneratedColumn<int> expiresAt = GeneratedColumn<int>(
      'expires_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, hasPro, credits, expiresAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'entitlements_cache';
  @override
  VerificationContext validateIntegrity(
      Insertable<EntitlementsCacheData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('has_pro')) {
      context.handle(_hasProMeta,
          hasPro.isAcceptableOrUnknown(data['has_pro']!, _hasProMeta));
    }
    if (data.containsKey('credits')) {
      context.handle(_creditsMeta,
          credits.isAcceptableOrUnknown(data['credits']!, _creditsMeta));
    }
    if (data.containsKey('expires_at')) {
      context.handle(_expiresAtMeta,
          expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EntitlementsCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EntitlementsCacheData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hasPro: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}has_pro'])!,
      credits: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credits'])!,
      expiresAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expires_at']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $EntitlementsCacheTable createAlias(String alias) {
    return $EntitlementsCacheTable(attachedDatabase, alias);
  }
}

class EntitlementsCacheData extends DataClass
    implements Insertable<EntitlementsCacheData> {
  final int id;
  final bool hasPro;
  final int credits;
  final int? expiresAt;
  final int updatedAt;
  const EntitlementsCacheData(
      {required this.id,
      required this.hasPro,
      required this.credits,
      this.expiresAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['has_pro'] = Variable<bool>(hasPro);
    map['credits'] = Variable<int>(credits);
    if (!nullToAbsent || expiresAt != null) {
      map['expires_at'] = Variable<int>(expiresAt);
    }
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  EntitlementsCacheCompanion toCompanion(bool nullToAbsent) {
    return EntitlementsCacheCompanion(
      id: Value(id),
      hasPro: Value(hasPro),
      credits: Value(credits),
      expiresAt: expiresAt == null && nullToAbsent
          ? const Value.absent()
          : Value(expiresAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory EntitlementsCacheData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EntitlementsCacheData(
      id: serializer.fromJson<int>(json['id']),
      hasPro: serializer.fromJson<bool>(json['hasPro']),
      credits: serializer.fromJson<int>(json['credits']),
      expiresAt: serializer.fromJson<int?>(json['expiresAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hasPro': serializer.toJson<bool>(hasPro),
      'credits': serializer.toJson<int>(credits),
      'expiresAt': serializer.toJson<int?>(expiresAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  EntitlementsCacheData copyWith(
          {int? id,
          bool? hasPro,
          int? credits,
          Value<int?> expiresAt = const Value.absent(),
          int? updatedAt}) =>
      EntitlementsCacheData(
        id: id ?? this.id,
        hasPro: hasPro ?? this.hasPro,
        credits: credits ?? this.credits,
        expiresAt: expiresAt.present ? expiresAt.value : this.expiresAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  EntitlementsCacheData copyWithCompanion(EntitlementsCacheCompanion data) {
    return EntitlementsCacheData(
      id: data.id.present ? data.id.value : this.id,
      hasPro: data.hasPro.present ? data.hasPro.value : this.hasPro,
      credits: data.credits.present ? data.credits.value : this.credits,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EntitlementsCacheData(')
          ..write('id: $id, ')
          ..write('hasPro: $hasPro, ')
          ..write('credits: $credits, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hasPro, credits, expiresAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EntitlementsCacheData &&
          other.id == this.id &&
          other.hasPro == this.hasPro &&
          other.credits == this.credits &&
          other.expiresAt == this.expiresAt &&
          other.updatedAt == this.updatedAt);
}

class EntitlementsCacheCompanion
    extends UpdateCompanion<EntitlementsCacheData> {
  final Value<int> id;
  final Value<bool> hasPro;
  final Value<int> credits;
  final Value<int?> expiresAt;
  final Value<int> updatedAt;
  const EntitlementsCacheCompanion({
    this.id = const Value.absent(),
    this.hasPro = const Value.absent(),
    this.credits = const Value.absent(),
    this.expiresAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EntitlementsCacheCompanion.insert({
    this.id = const Value.absent(),
    this.hasPro = const Value.absent(),
    this.credits = const Value.absent(),
    this.expiresAt = const Value.absent(),
    required int updatedAt,
  }) : updatedAt = Value(updatedAt);
  static Insertable<EntitlementsCacheData> custom({
    Expression<int>? id,
    Expression<bool>? hasPro,
    Expression<int>? credits,
    Expression<int>? expiresAt,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hasPro != null) 'has_pro': hasPro,
      if (credits != null) 'credits': credits,
      if (expiresAt != null) 'expires_at': expiresAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EntitlementsCacheCompanion copyWith(
      {Value<int>? id,
      Value<bool>? hasPro,
      Value<int>? credits,
      Value<int?>? expiresAt,
      Value<int>? updatedAt}) {
    return EntitlementsCacheCompanion(
      id: id ?? this.id,
      hasPro: hasPro ?? this.hasPro,
      credits: credits ?? this.credits,
      expiresAt: expiresAt ?? this.expiresAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hasPro.present) {
      map['has_pro'] = Variable<bool>(hasPro.value);
    }
    if (credits.present) {
      map['credits'] = Variable<int>(credits.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<int>(expiresAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntitlementsCacheCompanion(')
          ..write('id: $id, ')
          ..write('hasPro: $hasPro, ')
          ..write('credits: $credits, ')
          ..write('expiresAt: $expiresAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DecisionsTable extends Decisions
    with TableInfo<$DecisionsTable, Decision> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DecisionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _situationTypeMeta =
      const VerificationMeta('situationType');
  @override
  late final GeneratedColumn<String> situationType = GeneratedColumn<String>(
      'situation_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contextTextMeta =
      const VerificationMeta('contextText');
  @override
  late final GeneratedColumn<String> contextText = GeneratedColumn<String>(
      'context_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _personLabelMeta =
      const VerificationMeta('personLabel');
  @override
  late final GeneratedColumn<String> personLabel = GeneratedColumn<String>(
      'person_label', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _summaryTextMeta =
      const VerificationMeta('summaryText');
  @override
  late final GeneratedColumn<String> summaryText = GeneratedColumn<String>(
      'summary_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailedTextMeta =
      const VerificationMeta('detailedText');
  @override
  late final GeneratedColumn<String> detailedText = GeneratedColumn<String>(
      'detailed_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        situationType,
        contextText,
        personLabel,
        summaryText,
        detailedText,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'decisions';
  @override
  VerificationContext validateIntegrity(Insertable<Decision> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('situation_type')) {
      context.handle(
          _situationTypeMeta,
          situationType.isAcceptableOrUnknown(
              data['situation_type']!, _situationTypeMeta));
    } else if (isInserting) {
      context.missing(_situationTypeMeta);
    }
    if (data.containsKey('context_text')) {
      context.handle(
          _contextTextMeta,
          contextText.isAcceptableOrUnknown(
              data['context_text']!, _contextTextMeta));
    } else if (isInserting) {
      context.missing(_contextTextMeta);
    }
    if (data.containsKey('person_label')) {
      context.handle(
          _personLabelMeta,
          personLabel.isAcceptableOrUnknown(
              data['person_label']!, _personLabelMeta));
    }
    if (data.containsKey('summary_text')) {
      context.handle(
          _summaryTextMeta,
          summaryText.isAcceptableOrUnknown(
              data['summary_text']!, _summaryTextMeta));
    } else if (isInserting) {
      context.missing(_summaryTextMeta);
    }
    if (data.containsKey('detailed_text')) {
      context.handle(
          _detailedTextMeta,
          detailedText.isAcceptableOrUnknown(
              data['detailed_text']!, _detailedTextMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Decision map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Decision(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      situationType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}situation_type'])!,
      contextText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}context_text'])!,
      personLabel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}person_label']),
      summaryText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary_text'])!,
      detailedText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}detailed_text']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $DecisionsTable createAlias(String alias) {
    return $DecisionsTable(attachedDatabase, alias);
  }
}

class Decision extends DataClass implements Insertable<Decision> {
  final String id;
  final String situationType;
  final String contextText;
  final String? personLabel;
  final String summaryText;
  final String? detailedText;
  final int createdAt;
  const Decision(
      {required this.id,
      required this.situationType,
      required this.contextText,
      this.personLabel,
      required this.summaryText,
      this.detailedText,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['situation_type'] = Variable<String>(situationType);
    map['context_text'] = Variable<String>(contextText);
    if (!nullToAbsent || personLabel != null) {
      map['person_label'] = Variable<String>(personLabel);
    }
    map['summary_text'] = Variable<String>(summaryText);
    if (!nullToAbsent || detailedText != null) {
      map['detailed_text'] = Variable<String>(detailedText);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  DecisionsCompanion toCompanion(bool nullToAbsent) {
    return DecisionsCompanion(
      id: Value(id),
      situationType: Value(situationType),
      contextText: Value(contextText),
      personLabel: personLabel == null && nullToAbsent
          ? const Value.absent()
          : Value(personLabel),
      summaryText: Value(summaryText),
      detailedText: detailedText == null && nullToAbsent
          ? const Value.absent()
          : Value(detailedText),
      createdAt: Value(createdAt),
    );
  }

  factory Decision.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Decision(
      id: serializer.fromJson<String>(json['id']),
      situationType: serializer.fromJson<String>(json['situationType']),
      contextText: serializer.fromJson<String>(json['contextText']),
      personLabel: serializer.fromJson<String?>(json['personLabel']),
      summaryText: serializer.fromJson<String>(json['summaryText']),
      detailedText: serializer.fromJson<String?>(json['detailedText']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'situationType': serializer.toJson<String>(situationType),
      'contextText': serializer.toJson<String>(contextText),
      'personLabel': serializer.toJson<String?>(personLabel),
      'summaryText': serializer.toJson<String>(summaryText),
      'detailedText': serializer.toJson<String?>(detailedText),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Decision copyWith(
          {String? id,
          String? situationType,
          String? contextText,
          Value<String?> personLabel = const Value.absent(),
          String? summaryText,
          Value<String?> detailedText = const Value.absent(),
          int? createdAt}) =>
      Decision(
        id: id ?? this.id,
        situationType: situationType ?? this.situationType,
        contextText: contextText ?? this.contextText,
        personLabel: personLabel.present ? personLabel.value : this.personLabel,
        summaryText: summaryText ?? this.summaryText,
        detailedText:
            detailedText.present ? detailedText.value : this.detailedText,
        createdAt: createdAt ?? this.createdAt,
      );
  Decision copyWithCompanion(DecisionsCompanion data) {
    return Decision(
      id: data.id.present ? data.id.value : this.id,
      situationType: data.situationType.present
          ? data.situationType.value
          : this.situationType,
      contextText:
          data.contextText.present ? data.contextText.value : this.contextText,
      personLabel:
          data.personLabel.present ? data.personLabel.value : this.personLabel,
      summaryText:
          data.summaryText.present ? data.summaryText.value : this.summaryText,
      detailedText: data.detailedText.present
          ? data.detailedText.value
          : this.detailedText,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Decision(')
          ..write('id: $id, ')
          ..write('situationType: $situationType, ')
          ..write('contextText: $contextText, ')
          ..write('personLabel: $personLabel, ')
          ..write('summaryText: $summaryText, ')
          ..write('detailedText: $detailedText, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, situationType, contextText, personLabel,
      summaryText, detailedText, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Decision &&
          other.id == this.id &&
          other.situationType == this.situationType &&
          other.contextText == this.contextText &&
          other.personLabel == this.personLabel &&
          other.summaryText == this.summaryText &&
          other.detailedText == this.detailedText &&
          other.createdAt == this.createdAt);
}

class DecisionsCompanion extends UpdateCompanion<Decision> {
  final Value<String> id;
  final Value<String> situationType;
  final Value<String> contextText;
  final Value<String?> personLabel;
  final Value<String> summaryText;
  final Value<String?> detailedText;
  final Value<int> createdAt;
  final Value<int> rowid;
  const DecisionsCompanion({
    this.id = const Value.absent(),
    this.situationType = const Value.absent(),
    this.contextText = const Value.absent(),
    this.personLabel = const Value.absent(),
    this.summaryText = const Value.absent(),
    this.detailedText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DecisionsCompanion.insert({
    required String id,
    required String situationType,
    required String contextText,
    this.personLabel = const Value.absent(),
    required String summaryText,
    this.detailedText = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        situationType = Value(situationType),
        contextText = Value(contextText),
        summaryText = Value(summaryText),
        createdAt = Value(createdAt);
  static Insertable<Decision> custom({
    Expression<String>? id,
    Expression<String>? situationType,
    Expression<String>? contextText,
    Expression<String>? personLabel,
    Expression<String>? summaryText,
    Expression<String>? detailedText,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (situationType != null) 'situation_type': situationType,
      if (contextText != null) 'context_text': contextText,
      if (personLabel != null) 'person_label': personLabel,
      if (summaryText != null) 'summary_text': summaryText,
      if (detailedText != null) 'detailed_text': detailedText,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DecisionsCompanion copyWith(
      {Value<String>? id,
      Value<String>? situationType,
      Value<String>? contextText,
      Value<String?>? personLabel,
      Value<String>? summaryText,
      Value<String?>? detailedText,
      Value<int>? createdAt,
      Value<int>? rowid}) {
    return DecisionsCompanion(
      id: id ?? this.id,
      situationType: situationType ?? this.situationType,
      contextText: contextText ?? this.contextText,
      personLabel: personLabel ?? this.personLabel,
      summaryText: summaryText ?? this.summaryText,
      detailedText: detailedText ?? this.detailedText,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (situationType.present) {
      map['situation_type'] = Variable<String>(situationType.value);
    }
    if (contextText.present) {
      map['context_text'] = Variable<String>(contextText.value);
    }
    if (personLabel.present) {
      map['person_label'] = Variable<String>(personLabel.value);
    }
    if (summaryText.present) {
      map['summary_text'] = Variable<String>(summaryText.value);
    }
    if (detailedText.present) {
      map['detailed_text'] = Variable<String>(detailedText.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DecisionsCompanion(')
          ..write('id: $id, ')
          ..write('situationType: $situationType, ')
          ..write('contextText: $contextText, ')
          ..write('personLabel: $personLabel, ')
          ..write('summaryText: $summaryText, ')
          ..write('detailedText: $detailedText, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EntitlementsCacheTable entitlementsCache =
      $EntitlementsCacheTable(this);
  late final $DecisionsTable decisions = $DecisionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [entitlementsCache, decisions];
}

typedef $$EntitlementsCacheTableCreateCompanionBuilder
    = EntitlementsCacheCompanion Function({
  Value<int> id,
  Value<bool> hasPro,
  Value<int> credits,
  Value<int?> expiresAt,
  required int updatedAt,
});
typedef $$EntitlementsCacheTableUpdateCompanionBuilder
    = EntitlementsCacheCompanion Function({
  Value<int> id,
  Value<bool> hasPro,
  Value<int> credits,
  Value<int?> expiresAt,
  Value<int> updatedAt,
});

class $$EntitlementsCacheTableFilterComposer
    extends Composer<_$AppDatabase, $EntitlementsCacheTable> {
  $$EntitlementsCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get hasPro => $composableBuilder(
      column: $table.hasPro, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get credits => $composableBuilder(
      column: $table.credits, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$EntitlementsCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $EntitlementsCacheTable> {
  $$EntitlementsCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get hasPro => $composableBuilder(
      column: $table.hasPro, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get credits => $composableBuilder(
      column: $table.credits, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get expiresAt => $composableBuilder(
      column: $table.expiresAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$EntitlementsCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $EntitlementsCacheTable> {
  $$EntitlementsCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get hasPro =>
      $composableBuilder(column: $table.hasPro, builder: (column) => column);

  GeneratedColumn<int> get credits =>
      $composableBuilder(column: $table.credits, builder: (column) => column);

  GeneratedColumn<int> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$EntitlementsCacheTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EntitlementsCacheTable,
    EntitlementsCacheData,
    $$EntitlementsCacheTableFilterComposer,
    $$EntitlementsCacheTableOrderingComposer,
    $$EntitlementsCacheTableAnnotationComposer,
    $$EntitlementsCacheTableCreateCompanionBuilder,
    $$EntitlementsCacheTableUpdateCompanionBuilder,
    (
      EntitlementsCacheData,
      BaseReferences<_$AppDatabase, $EntitlementsCacheTable,
          EntitlementsCacheData>
    ),
    EntitlementsCacheData,
    PrefetchHooks Function()> {
  $$EntitlementsCacheTableTableManager(
      _$AppDatabase db, $EntitlementsCacheTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EntitlementsCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EntitlementsCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EntitlementsCacheTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> hasPro = const Value.absent(),
            Value<int> credits = const Value.absent(),
            Value<int?> expiresAt = const Value.absent(),
            Value<int> updatedAt = const Value.absent(),
          }) =>
              EntitlementsCacheCompanion(
            id: id,
            hasPro: hasPro,
            credits: credits,
            expiresAt: expiresAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<bool> hasPro = const Value.absent(),
            Value<int> credits = const Value.absent(),
            Value<int?> expiresAt = const Value.absent(),
            required int updatedAt,
          }) =>
              EntitlementsCacheCompanion.insert(
            id: id,
            hasPro: hasPro,
            credits: credits,
            expiresAt: expiresAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EntitlementsCacheTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EntitlementsCacheTable,
    EntitlementsCacheData,
    $$EntitlementsCacheTableFilterComposer,
    $$EntitlementsCacheTableOrderingComposer,
    $$EntitlementsCacheTableAnnotationComposer,
    $$EntitlementsCacheTableCreateCompanionBuilder,
    $$EntitlementsCacheTableUpdateCompanionBuilder,
    (
      EntitlementsCacheData,
      BaseReferences<_$AppDatabase, $EntitlementsCacheTable,
          EntitlementsCacheData>
    ),
    EntitlementsCacheData,
    PrefetchHooks Function()>;
typedef $$DecisionsTableCreateCompanionBuilder = DecisionsCompanion Function({
  required String id,
  required String situationType,
  required String contextText,
  Value<String?> personLabel,
  required String summaryText,
  Value<String?> detailedText,
  required int createdAt,
  Value<int> rowid,
});
typedef $$DecisionsTableUpdateCompanionBuilder = DecisionsCompanion Function({
  Value<String> id,
  Value<String> situationType,
  Value<String> contextText,
  Value<String?> personLabel,
  Value<String> summaryText,
  Value<String?> detailedText,
  Value<int> createdAt,
  Value<int> rowid,
});

class $$DecisionsTableFilterComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get situationType => $composableBuilder(
      column: $table.situationType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contextText => $composableBuilder(
      column: $table.contextText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get personLabel => $composableBuilder(
      column: $table.personLabel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summaryText => $composableBuilder(
      column: $table.summaryText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detailedText => $composableBuilder(
      column: $table.detailedText, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$DecisionsTableOrderingComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get situationType => $composableBuilder(
      column: $table.situationType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contextText => $composableBuilder(
      column: $table.contextText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get personLabel => $composableBuilder(
      column: $table.personLabel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summaryText => $composableBuilder(
      column: $table.summaryText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detailedText => $composableBuilder(
      column: $table.detailedText,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$DecisionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DecisionsTable> {
  $$DecisionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get situationType => $composableBuilder(
      column: $table.situationType, builder: (column) => column);

  GeneratedColumn<String> get contextText => $composableBuilder(
      column: $table.contextText, builder: (column) => column);

  GeneratedColumn<String> get personLabel => $composableBuilder(
      column: $table.personLabel, builder: (column) => column);

  GeneratedColumn<String> get summaryText => $composableBuilder(
      column: $table.summaryText, builder: (column) => column);

  GeneratedColumn<String> get detailedText => $composableBuilder(
      column: $table.detailedText, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DecisionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DecisionsTable,
    Decision,
    $$DecisionsTableFilterComposer,
    $$DecisionsTableOrderingComposer,
    $$DecisionsTableAnnotationComposer,
    $$DecisionsTableCreateCompanionBuilder,
    $$DecisionsTableUpdateCompanionBuilder,
    (Decision, BaseReferences<_$AppDatabase, $DecisionsTable, Decision>),
    Decision,
    PrefetchHooks Function()> {
  $$DecisionsTableTableManager(_$AppDatabase db, $DecisionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DecisionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DecisionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DecisionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> situationType = const Value.absent(),
            Value<String> contextText = const Value.absent(),
            Value<String?> personLabel = const Value.absent(),
            Value<String> summaryText = const Value.absent(),
            Value<String?> detailedText = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DecisionsCompanion(
            id: id,
            situationType: situationType,
            contextText: contextText,
            personLabel: personLabel,
            summaryText: summaryText,
            detailedText: detailedText,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String situationType,
            required String contextText,
            Value<String?> personLabel = const Value.absent(),
            required String summaryText,
            Value<String?> detailedText = const Value.absent(),
            required int createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              DecisionsCompanion.insert(
            id: id,
            situationType: situationType,
            contextText: contextText,
            personLabel: personLabel,
            summaryText: summaryText,
            detailedText: detailedText,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DecisionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DecisionsTable,
    Decision,
    $$DecisionsTableFilterComposer,
    $$DecisionsTableOrderingComposer,
    $$DecisionsTableAnnotationComposer,
    $$DecisionsTableCreateCompanionBuilder,
    $$DecisionsTableUpdateCompanionBuilder,
    (Decision, BaseReferences<_$AppDatabase, $DecisionsTable, Decision>),
    Decision,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EntitlementsCacheTableTableManager get entitlementsCache =>
      $$EntitlementsCacheTableTableManager(_db, _db.entitlementsCache);
  $$DecisionsTableTableManager get decisions =>
      $$DecisionsTableTableManager(_db, _db.decisions);
}
