import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Question extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get string => text().nullable().unique()();
}

@DriftDatabase(tables: [Question])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  Future<int> downloadQuestion(String questionString) async {
    return await into(question).insert(QuestionCompanion.insert(
      string: Value(questionString),
    ));
  }

  Future<List<QuestionData>> get allSavedQuestions => select(question).get();

  Future<int> deleteQuestionById(int id) async =>
      await (delete(question)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
