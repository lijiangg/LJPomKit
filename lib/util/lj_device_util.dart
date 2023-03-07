
import 'package:path_provider/path_provider.dart' as PathTool;

class LJDeviceUtil {
  //获取临时文件路径(IOS和安卓通用)
  static Future<String> getTemporaryDirectory() {
    return PathTool.getTemporaryDirectory().then((value) {
      return value.path;
    });
  }

  //获取应用支持目录(IOS和安卓通用) 不跟用户分享
  static Future<String> getApplicationSupportDirectory() {
    return PathTool.getApplicationSupportDirectory().then((value) {
      return value.path;
    });
  }

  //获取应用文件目录(IOS和安卓通用)，针对 Android 设备的 AppDate 目录，iOS 设备的 NSDocumentDirectory 目录 可以和用户分享
  static Future<String> getApplicationDocumentsDirectory() {
    return PathTool.getApplicationDocumentsDirectory().then((value) {
      return value.path;
    });
  }

  //获取应用持久存储目录路径(仅IOS可用)
  static Future<String> getLibraryDirectory() {
    return PathTool.getLibraryDirectory().then((value) {
      return value.path;
    });
  }

  //获取存储卡目录(仅安卓可用)
  static Future<String?> getExternalStorageDirectory() {
    return PathTool.getExternalStorageDirectory().then((value) {
      return value?.path;
    });
  }

  //获取外部缓存目录(仅安卓可用)
  static Future<List<String>?> getExternalCacheDirectories() {
    return PathTool.getExternalCacheDirectories().then((value) {
      if (value == null) {
        return null;
      }
      return List.generate(value!.length, (index) => value![index].path);
    });
  }

  //获取下载目录(仅桌面可用)
  static Future<String?> getDownloadsDirectory() {
    return PathTool.getDownloadsDirectory().then((value) {
      return value?.path;
    });
  }

}