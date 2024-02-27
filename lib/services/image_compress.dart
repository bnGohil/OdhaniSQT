// import 'dart:io';
//
//
//
// class ImageCompress {
//
//   static Future<File?> testCompressAndGetFile(String? file, String? targetPath) async {
//     try {
//
//       final bytesSize =  await File(file ?? "").readAsBytes();
//
//       int compression = 30;
//
//       if(bytesSize.lengthInBytes > 2000000) {
//         compression = 25;
//       } else if(bytesSize.lengthInBytes > 1000000) {
//         compression = 50;
//       } else {
//         compression = 30;
//       }
//
//       var result = await FlutterImageCompress.compressAndGetFile(
//             file ?? "", targetPath ?? "",
//             quality: compression
//           );
//
//       return File(result?.path ?? "");
//
//     } catch (e) {
//       print("error file compress ${e}");
//       return null;
//     }
//   }
//
// }