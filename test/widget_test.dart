// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:project_toko_buku/main.dart';
// import 'mocks.mocks.dart';

// void main() {
//   TestWidgetsFlutterBinding.ensureInitialized();

//   late MockFirebaseFirestore mockFirestore;
//   late MockCollectionReference mockCollection;
//   late MockQuerySnapshot mockSnapshot;
//   late MockQueryDocumentSnapshot mockDocument;

//   setUp(() async {
//     await Firebase.initializeApp();
//     mockFirestore = MockFirebaseFirestore();
//     mockCollection = MockCollectionReference();
//     mockSnapshot = MockQuerySnapshot();
//     mockDocument = MockQueryDocumentSnapshot();

//     // Mock Firestore collection behavior
//     when(mockFirestore.collection('books')).thenReturn(mockCollection as CollectionReference<Map<String, dynamic>>);

//     // Mock snapshot behavior
//     when(mockCollection.snapshots()).thenAnswer((_) => Stream.value(mockSnapshot));
//     when(mockSnapshot.docs).thenReturn([mockDocument]);

//     // Mock document data
//     when(mockDocument.data()).thenReturn({
//       'title': 'Test Book',
//       'author': 'Test Author',
//       'price': 9.99,
//     });
//   });

//   testWidgets('BookStoreApp widget test', (WidgetTester tester) async {
//     await tester.pumpWidget(const BookStoreApp());

//     // Verify that the app starts with the correct title
//     expect(find.text('Bookstore'), findsOneWidget);
//     expect(find.text('No books found.'), findsNothing);

//     // Verify book data is shown from mock Firestore
//     expect(find.text('Test Book'), findsOneWidget);
//     expect(find.text('Test Author'), findsOneWidget);
//     expect(find.text('\$9.99'), findsOneWidget);
//   });
// }
