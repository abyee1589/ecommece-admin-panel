
import 'package:ab_ecommerce_admin_panel/features/media/controllers/media_controller.dart';
import 'package:get/get.dart';

import '../../../media/models/image_model.dart';

class ProductImagesController extends GetxController{
  static ProductImagesController get instance => Get.find();

  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

  final RxList<String> additionalProductImageUrls = <String>[].obs;

  void selectThumbnailImage() async {
    final controller = MediaController.instance;
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if(selectedImages != null && selectedImages.isNotEmpty){
      ImageModel selectedImage = selectedImages.first;
      selectedThumbnailImageUrl.value = selectedImage.url;
    }
  }

  void selectMultipleProductImages() async {
    final controller = MediaController.instance;
    final List<ImageModel>? selectedImages = await controller.selectImagesFromMedia(allowMultipleSelection: true, selectedUrls: additionalProductImageUrls);

    if(selectedImages != null && selectedImages.isNotEmpty){
      additionalProductImageUrls.assignAll(selectedImages.map((image) => image.url));
    }
  }

  Future<void> removeImage(int index) async{
    additionalProductImageUrls.removeAt(index);
  }
}