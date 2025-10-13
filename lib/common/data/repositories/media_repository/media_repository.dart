import 'dart:convert';
import 'dart:io' as io;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../features/media/models/image_model.dart';
import '../../../../utils/constants/enums.dart';

class MediaRepository {
  final firestore = FirebaseFirestore.instance;
  static final MediaRepository _instance = MediaRepository._internal();
  factory MediaRepository() => _instance;
  MediaRepository._internal();

  final _cloudinary = CloudinaryPublic(
    'YOUR_CLOUD_NAME',
    'YOUR_UNSIGNED_UPLOAD_PRESET',
    cache: false,
  );

  final _firestore = FirebaseFirestore.instance;

  /// 🔹 Upload image to Cloudinary (cross-platform)
  Future<ImageModel> uploadImageToCloudinary({required dynamic file, required String path, String? fileName, DropzoneViewController? dropzoneController}) async {
    try {
      late Uint8List bytes;
      late String finalFileName;

      if (kIsWeb) {
        if (file is html.File) {
          // normal html file
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);
          await reader.onLoad.first;
          bytes = reader.result as Uint8List;
          finalFileName = fileName ?? file.name;
        } else {
          // DropzoneFile from flutter_dropzone
          if (dropzoneController == null) {
            throw 'Dropzone controller is required for DropzoneFile';
          }
          bytes = await dropzoneController.getFileData(file);
          finalFileName = fileName ?? await dropzoneController.getFilename(file);
        }
      } else if (file is XFile) {
        bytes = await file.readAsBytes();
        finalFileName = fileName ?? file.name;
      } else if (file is io.File) {
        bytes = await file.readAsBytes();
        finalFileName = fileName ?? file.path.split('/').last;
      } else {
        throw 'Unsupported file type: ${file.runtimeType}';
      }

      // Upload to Cloudinary
      final uri = Uri.parse('https://api.cloudinary.com/v1_1/dxkvofpde/image/upload');
      final request = http.MultipartRequest('POST', uri)
        ..fields['upload_preset'] = 'flutter_unsigned'
        ..fields['folder'] = path
        ..files.add(http.MultipartFile.fromBytes('file', bytes, filename: finalFileName));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode != 200) {
        throw 'Cloudinary upload failed: ${response.body}';
      }

      final data = jsonDecode(response.body);

      return ImageModel.fromCloudinary(data);

    } catch (e) {
      throw e.toString();
    }
  }


  Future<void> saveImageDataToFirestore(ImageModel imageData) async {
    try {
      await firestore.collection('images').add(imageData.toJson());
    } on FirebaseException catch (e) {
      throw e.message!;
    } on io.SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ImageModel>> fetchImagesFromDatabase(MediaCategory mediaCategory, int loadCount) async {
    try {
      final querySnapshot = await firestore.collection('images')
        .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
        .orderBy('createdAt', descending: true)
        .limit(loadCount)
        .get();
      return querySnapshot.docs.map((image) => ImageModel.fromSnapshot(image)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on io.SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ImageModel>> loadMoreImagesFromDatabase(MediaCategory mediaCategory, int loadCount, DateTime lastFetchedDate) async {
    try {
      final querySnapshot = await firestore.collection('images')
        .where('mediaCategory', isEqualTo: mediaCategory.name.toString())
        .orderBy('createdAt', descending: true)
        .startAfter([lastFetchedDate])
        .limit(loadCount)
        .get();
      return querySnapshot.docs.map((image) => ImageModel.fromSnapshot(image)).toList();
    } on FirebaseException catch (e) {
      throw e.message!;
    } on io.SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
