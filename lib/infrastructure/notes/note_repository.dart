import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
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
  Future<Either<NoteFailure, Unit>> create(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection.doc(noteDTO.id).set(noteDTO.toJson());

      return right(unit);
    } on FirebaseException catch (exception) {
      if (exception.message!.contains("PERMISSION_DENIED")) {
        return left(const NoteFailure.insufficientPermission());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> delete(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteId = note.id.getOrCrash();

      await userDoc.noteCollection.doc(noteId).delete();

      return right(unit);
    } on FirebaseException catch (exception) {
      if (exception.message!.contains("PERMISSION_DENIED")) {
        return left(const NoteFailure.insufficientPermission());
      } else if (exception.message!.contains("NOT_FOUND")) {
        return left(const NoteFailure.notFound());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<NoteFailure, Unit>> update(Note note) async {
    try {
      final userDoc = await _firestore.userDocument();
      final noteDTO = NoteDTO.fromDomain(note);

      await userDoc.noteCollection.doc(noteDTO.id).update(noteDTO.toJson());

      return right(unit);
    } on FirebaseException catch (exception) {
      if (exception.message!.contains("PERMISSION_DENIED")) {
        return left(const NoteFailure.insufficientPermission());
      } else if (exception.message!.contains("NOT_FOUND")) {
        return left(const NoteFailure.notFound());
      } else {
        return left(const NoteFailure.unexpected());
      }
    }
  }

  @override
  Stream<Either<NoteFailure, KtList<Note>>> watchAll() async* {
    final userDoc = await _firestore.userDocument();
    yield* userDoc.noteCollection
        .orderBy("serverTimeStamp", descending: true)
        .snapshots()
        .map((snapshot) {
      final docs = snapshot.docs.where((doc) => !doc.metadata.hasPendingWrites);

      return right<NoteFailure, KtList<Note>>(
        docs
            .map((doc) => NoteDTO.fromFirestore(doc).toDomain())
            .toImmutableList(),
      );
    }).onErrorReturnWith((error, _) {
      if (error is FirebaseException &&
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
        .map((snapshot) {
          final docs =
              snapshot.docs.where((doc) => !doc.metadata.hasPendingWrites);

          return docs.map(
            (doc) => NoteDTO.fromFirestore(doc).toDomain(),
          );
        })
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
          if (error is FirebaseException &&
              error.message!.contains("PERMISSION_DENIED")) {
            return left(const NoteFailure.insufficientPermission());
          } else {
            return left(const NoteFailure.unexpected());
          }
        });
  }
}
