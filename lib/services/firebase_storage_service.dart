// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';

// class FirebaseStorageService {
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   Future<String> uploadFile(String path, String fileName) async {
//     try {
//       // Convert the path (String) to a File
//       File file = File(path);

//       // Upload the file to Firebase Storage
//       final ref = _storage.ref().child('uploads').child(fileName);
//       final uploadTask = ref.putFile(file);

//       final snapshot = await uploadTask;
//       final downloadUrl = await snapshot.ref.getDownloadURL();
      
//       return downloadUrl; // Return the URL of the uploaded file
//     } catch (e) {
//       print("Error uploading file: $e");
//       return ''; // Return an empty string in case of an error
//     }
//   }
// }
