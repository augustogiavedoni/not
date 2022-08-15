import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:kt_dart/collection.dart';
import 'package:not/domain/auth/i_auth_facade.dart';
import 'package:not/domain/core/errors.dart';
import 'package:not/domain/core/value_objects/unique_id.dart';
import 'package:not/domain/notes/entities/note.dart';
import 'package:not/domain/notes/value_objects/list_3.dart';
import 'package:not/domain/notes/value_objects/note_body.dart';
import 'package:not/domain/notes/value_objects/note_color.dart';
import 'package:not/infrastructure/auth/firebase_auth_facade.dart';
import 'package:not/infrastructure/notes/note_repository.dart';

void main() {
  group("Empty note", () {
    late Note note;

    setUp(() {
      note = Note.empty();
    });

    test(
      "An exception should be thrown when trying to retrieve the body",
      () {
        expect(
          () => note.body.getOrCrash(),
          throwsA(isA<UnexpectedValueError>()),
        );
      },
    );

    test(
      "The length of the To-Do list should be 0",
      () {
        expect(note.todos.length, 0);
      },
    );

    test(
      "The ID should be valid",
      () {
        expect(note.id.isValid(), true);
      },
    );

    test(
      "The color should be the predefined one",
      () {
        expect(note.color.getOrCrash(), NoteColor.predefinedColors.first);
      },
    );
  });

  group("Mocked NoteRepository", () {
    setUpAll(() {
      final GetIt getIt = GetIt.instance;
      final MockUser mockedUser = MockUser(
        displayName: "Test User",
        email: "test@test.com",
        uid: "abcdefghijklmnñopqrstuvwxyz",
      );
      final MockFirebaseAuth mockedFirebaseAuth = MockFirebaseAuth(
        mockUser: mockedUser,
      );

      getIt.registerLazySingleton<FirebaseFirestore>(
        () => FakeFirebaseFirestore(),
      );
      getIt.registerLazySingleton<IAuthFacade>(
        () => FirebaseAuthFacade(
          mockedFirebaseAuth,
          MockGoogleSignIn(),
        ),
      );

      mockedFirebaseAuth.signInWithEmailAndPassword(
        email: "test@test.com",
        password: "test",
      );
    });
    test("Successfuly add a new note to the repository", () async {
      final FakeFirebaseFirestore fakeFirebaseFirestore =
          FakeFirebaseFirestore();
      final NoteRepository noteRepository =
          NoteRepository(fakeFirebaseFirestore);
      final Note mockedNote = Note(
        id: UniqueId(),
        body: NoteBody("This is a mocked note"),
        color: NoteColor(NoteColor.predefinedColors.first),
        todos: List3(const KtList.empty()),
      );

      final result = await noteRepository.create(mockedNote);

      expect(result.isRight(), true);
    });

    test("Failure when adding a note with empty body to the repository",
        () async {
      final FakeFirebaseFirestore fakeFirebaseFirestore =
          FakeFirebaseFirestore();
      final NoteRepository noteRepository =
          NoteRepository(fakeFirebaseFirestore);
      final Note mockedNote = Note(
        id: UniqueId(),
        body: NoteBody(""),
        color: NoteColor(NoteColor.predefinedColors.first),
        todos: List3(const KtList.empty()),
      );

      expect(
        () async => await noteRepository.create(mockedNote),
        throwsA(isA<UnexpectedValueError>()),
      );
    });

    test("Successfuly delete note from the repository", () async {
      final FakeFirebaseFirestore fakeFirebaseFirestore =
          FakeFirebaseFirestore();
      final NoteRepository noteRepository =
          NoteRepository(fakeFirebaseFirestore);
      final Note mockedNote = Note(
        id: UniqueId(),
        body: NoteBody("This is a mocked note"),
        color: NoteColor(NoteColor.predefinedColors.first),
        todos: List3(const KtList.empty()),
      );

      await noteRepository.create(mockedNote);
      final result = await noteRepository.delete(mockedNote);

      expect(result.isRight(), true);
    });

    test("Successfuly update a note inside the repository", () async {
      final FakeFirebaseFirestore fakeFirebaseFirestore =
          FakeFirebaseFirestore();
      final NoteRepository noteRepository =
          NoteRepository(fakeFirebaseFirestore);
      final UniqueId uniqueId = UniqueId();
      final Note mockedNote = Note(
        id: uniqueId,
        body: NoteBody("This is a mocked note"),
        color: NoteColor(NoteColor.predefinedColors.first),
        todos: List3(const KtList.empty()),
      );

      await noteRepository.create(mockedNote);

      final Note updatedMockedNote = Note(
        id: uniqueId,
        body: NoteBody("This note was updated"),
        color: NoteColor(NoteColor.predefinedColors.first),
        todos: List3(const KtList.empty()),
      );

      final result = await noteRepository.update(updatedMockedNote);

      expect(result.isRight(), true);
    });
  });
}
