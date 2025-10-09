import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/get_rx.dart';

class ImageModel {
  final String id;
  final String url;
  final String folder;
  final int? sizeBytes;
  String mediaCategory;
  final String? fullPath;
  final String fileName;
  final String? contentType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? publicId; // ✅ add this line

  /// Not mapped
  final dynamic file;
  RxBool isSelected = false.obs;
  final Uint8List? localImageToDisplay;

  ImageModel({
    this.id = '',
    required this.url,
    required this.folder,
    required this.fileName,
    this.sizeBytes,
    this.fullPath,
    this.createdAt,
    this.updatedAt,
    this.contentType,
    this.file,
    this.localImageToDisplay,
    this.mediaCategory = '',
    this.publicId, // ✅ add this line
  });

  static ImageModel empty() {
    return ImageModel(url: '', folder: '', fileName: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'folder': folder,
      'sizeBytes': sizeBytes,
      'fileName': fileName,
      'fullPath': fullPath,
      'createdAt': createdAt?.toUtc(),
      'contentType': contentType,
      'mediaCategory': mediaCategory,
      'publicId': publicId, // ✅ include this
    };
  }

  factory ImageModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return ImageModel(
        id: document.id,
        url: data['url'] ?? '',
        folder: data['folder'] ?? '',
        sizeBytes: data['sizeBytes'] ?? 0,
        fileName: data['fileName'] ?? '',
        fullPath: data['fullPath'] ?? '',
        createdAt: data.containsKey('createdAt') ? data['createdAt']?.toDate() : null,
        updatedAt: data.containsKey('updatedAt') ? data['updatedAt']?.toDate() : null,
        contentType: data['contentType'] ?? '',
        mediaCategory: data['mediaCategory'] ?? '',
        publicId: data['publicId'], // ✅ add this
      );
    } else {
      return ImageModel.empty();
    }
  }

  factory ImageModel.fromCloudinary(Map<String, dynamic> data) {
    return ImageModel(
      url: data['secure_url'] ?? data['url'] ?? '',
      folder: data['public_id'] != null
          ? data['public_id'].toString().split('/').first
          : '',
      fileName: data['public_id']?.toString().split('/').last ?? '',
      sizeBytes: data['bytes'] ?? 0,
      createdAt: DateTime.tryParse(data['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(data['created_at'] ?? ''),
      fullPath: data['public_id'],
      contentType: data['format'] ?? data['resource_type'],
      publicId: data['public_id'], // ✅ add this too
    );
  }
}
