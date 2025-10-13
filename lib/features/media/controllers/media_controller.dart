import 'dart:io';
import 'package:ab_ecommerce_admin_panel/common/data/repositories/media_repository/media_repository.dart';
import 'package:ab_ecommerce_admin_panel/features/media/models/image_model.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/enums.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/image_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/sizes.dart';
import 'package:ab_ecommerce_admin_panel/utils/constants/text_strings.dart';
import 'package:ab_ecommerce_admin_panel/utils/popups/full_screen_loader.dart';
import 'package:ab_ecommerce_admin_panel/utils/popups/loaders.dart';
import 'package:ab_ecommerce_admin_panel/utils/popups/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';


class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneController;
  final RxBool showImagesUploaderSection = false.obs;
  final RxBool loading = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;

  final int initialLoadCount = 20;
  final int loadMoreCount = 25;

  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProductImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImages = <ImageModel>[].obs;

  final MediaRepository mediaRepository = MediaRepository();

  Future<void> getMediaImages() async{
    try{
      loading.value = true;
      RxList<ImageModel> targetList = <ImageModel>[].obs;
      if(selectedPath.value == MediaCategory.banners){
        targetList = allBannerImages;
      }
      else if(selectedPath.value == MediaCategory.brands){
        targetList = allBrandImages;
      }
      if(selectedPath.value == MediaCategory.categories){
        targetList = allCategoryImages;
      }
      else if(selectedPath.value == MediaCategory.products){
        targetList = allProductImages;
      }
      else if(selectedPath.value == MediaCategory.users){
        targetList = allUserImages;
      }
      final images = await mediaRepository.fetchImagesFromDatabase(selectedPath.value, initialLoadCount);
      targetList.assignAll(images);
      loading.value = false;
    } catch(e){
      loading.value = false;
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong while loading images, please try again later!: ${e.toString()}');
    }
  }
  void loadMoreMedaiImages() async{
    try{
      loading.value = true;
      RxList<ImageModel> targetList = <ImageModel>[].obs;
      if(selectedPath.value == MediaCategory.banners){
        targetList = allBannerImages;
      }
      else if(selectedPath.value == MediaCategory.brands){
        targetList = allBrandImages;
      }
      if(selectedPath.value == MediaCategory.categories){
        targetList = allCategoryImages;
      }
      else if(selectedPath.value == MediaCategory.products){
        targetList = allProductImages;
      }
      else if(selectedPath.value == MediaCategory.users){
        targetList = allUserImages;
      }
      final images = await mediaRepository.loadMoreImagesFromDatabase(selectedPath.value, initialLoadCount, targetList.last.createdAt ?? DateTime.now());
      targetList.addAll(images);
      loading.value = false;
    } catch(e){
      loading.value = false;
      AbLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong while loading more images, please try again later!');
    }
  }


  /// 🔹 Select local images — works on Web, Mobile, and Desktop
  Future<void> selectedLocalImages() async {
    try {
      if (kIsWeb) {
        // ---- Web (Dropzone) ----
        final files = await dropzoneController.pickFiles(
          multiple: true,
          mime: ['image/jpeg', 'image/jpg', 'image/png'],
        );

        if (files.isNotEmpty) {
          for (var file in files) {
            final bytes = await dropzoneController.getFileData(file);
            final image = ImageModel(
              url: '',
              folder: '',
              file: file, // html.File for web
              fileName: file.name,
              localImageToDisplay: Uint8List.fromList(bytes),
            );
            selectedImagesToUpload.add(image);
          }
        }
      } else {
        // ---- Mobile/Desktop ----
        final result = await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: true,
        );

        if (result != null && result.files.isNotEmpty) {
          for (var file in result.files) {
            final bytes = file.bytes ?? await File(file.path!).readAsBytes();
            final image = ImageModel(
              url: '',
              folder: '',
              file: File(file.path!), // Normal File object
              fileName: file.name,
              localImageToDisplay: bytes,
            );
            selectedImagesToUpload.add(image);
          }
        }
      }
    } catch (e) {
      AbLoaders.errorSnackBar(
        title: 'Image Selection Failed',
        message: e.toString(),
      );
    }
  }

  /// 🔹 Confirm before uploading images
  void uploadImagesConfirmation() {
    if (selectedPath.value == MediaCategory.folders) {
      AbLoaders.warningSnackBar(
        title: 'Select Folder',
        message: 'Please select a folder to upload the images.',
      );
      return;
    }

    AbDialog.defaultDialog(
      context: Get.context!,
      title: 'Upload Images',
      confirmText: 'Upload',
      onConfirm: () {
        Get.back();
        uploadImages();
      },
      content:
          'Are you sure you want to upload all the images to ${selectedPath.value.name.toUpperCase()} folder?',
    );
  }

  /// 🔹 Upload images to Cloudinary + Firestore
  Future<void> uploadImages() async {
    try {
      uploadImagesLoader();

      MediaCategory selectedCategory = selectedPath.value;
      RxList<ImageModel> targetList;

      switch (selectedCategory) {
        case MediaCategory.banners:
          targetList = allBannerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImages;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImages;
          break;
        case MediaCategory.products:
          targetList = allProductImages;
          break;
        case MediaCategory.users:
          targetList = allUserImages;
          break;
        default:
          return;
      }

      for (var i = selectedImagesToUpload.length - 1; i >= 0; i--) {
        var selectedImage = selectedImagesToUpload[i];
        final imageFile = selectedImage.file;

        final uploadedImage = await mediaRepository.uploadImageToCloudinary(
          file: imageFile,
          path: getSelectedPath(),
          fileName: selectedImage.fileName,
          dropzoneController: dropzoneController,
        );

        uploadedImage.mediaCategory = selectedCategory.name;

        final id = await mediaRepository.saveImageDataToFirestore(uploadedImage);

        // uploadedImage.id = id;

        selectedImagesToUpload.removeAt(i);
        targetList.add(uploadedImage);
      }

      AbFullScreenLoader.stopLoading();
      AbLoaders.successSnackBar(
        title: 'Upload Complete',
        message: 'All images uploaded successfully!',
      );
    } catch (e) {
      AbFullScreenLoader.stopLoading();
      AbLoaders.errorSnackBar(
        title: 'Error Uploading Images',
        message: e.toString(),
      );
    }
  }

  /// 🔹 Upload progress dialog
  void uploadImagesLoader() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: const Text('Uploading Images'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AbImages.lottieAnimation, width: 300, height: 300),
              const SizedBox(height: AbSizes.spaceBtwItems),
              const Text('Sit tight, your images are uploading...')
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Get Firestore storage path by selected folder
  String getSelectedPath() {
    switch (selectedPath.value) {
      case MediaCategory.banners:
        return AbTexts.bannersStoragePath;
      case MediaCategory.brands:
        return AbTexts.brandsStoragePath;
      case MediaCategory.categories:
        return AbTexts.categoriesStoragePath;
      case MediaCategory.products:
        return AbTexts.productsStoragePath;
      case MediaCategory.users:
        return AbTexts.usersStoragePath;
      default:
        return 'Others';
    }
  }
}
