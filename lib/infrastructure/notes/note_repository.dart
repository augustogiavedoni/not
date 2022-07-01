import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/notes/entities/note.dart';
import '../../domain/notes/i_note_repository.dart';
import '../../domain/notes/note_failure.dart';
import '../core/firestore_helpers.dart';
import 'dto/note_dto.dart';

@Injectable(as: INoteRepository)
@lazySingleton
class NoteRepository implements INoteRepository {
  final FirebaseFirestore _firestore;

  NoteRepository(this._firestore);

  @override
  Future<Either<NoteFailure, Unit>> create(Note note) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy("serverTimeStamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => right<NoteFailure, KtList<Note>>(
            snapshot.docs
                .map((doc) => NoteDTO.fromFirestore(doc).toDomain())
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((error, _) {
      if (error is PlatformException &&
          error.message!.contains("PERMISSION_DENIED")) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchUncompleted() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy("serverTimeStamp", descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (doc) => NoteDTO.fromFirestore(doc).toDomain(),
          ),
        )
        .map(
          (notes) => right<NoteFailure, KtList<Note>>(
            notes
                .where((note) => note.todos
                    .getOrCrash()
                    .any((todoItem) => !todoItem.completed))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith((error, _) {
      if (error is PlatformException &&
          error.message!.contains("PERMISSION_DENIED")) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    });
  }
}
