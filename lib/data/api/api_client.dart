import 'package:ecommerce_app/utils/endpoints.dart';
import 'package:ecommerce_app/utils/helpers.dart';
import 'package:get/get.dart';

import '../../utils/local_storage_helper.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token = Endpoints.BASE_URL;
  late String appbaseurl;
  late Map<String, String> _mainHeader;
  LocalStorageHelper localStorageHelper = LocalStorageHelper();


  ApiClient({required String appbaseurl}) {
    baseUrl = appbaseurl;

    timeout = const Duration(seconds: 30);
    maxAuthRetries = 1;
    _mainHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

// POST METHOD
  Future<Response?> getRequest({
    required String url,
  }) async {
    try {
      Response response;
      // The below request is the same as above.
      var token = await localStorageHelper.retrieveItem(key: "token");

      logItem(url);

      _mainHeader = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      response = await get(url, headers: _mainHeader);

      if (response.statusCode == 401) {
        logout();
      }

      logItem("667777777===========================");

      print(response.statusCode);
      print(response.body.toString());
      return response;
    } catch (e) {
      logItem(".................................................................");
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response?> deleteRequest({
    required String url,
  }) async {
    try {
      Response response;
      // The below request is the same as above.
      var token = await localStorageHelper.retrieveItem(key: "token");

      logItem(url);

      _mainHeader = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer ${token}",
      };
      response = await delete(url, headers: _mainHeader);

      if (response.statusCode == 401) {
        logout();
      }

      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response?> postRequest(
      {required String url, required Map<dynamic, dynamic> data}) async {
    try {
      Response response;
      // The below request is the same as above.
      print("--------------------------------------");
      var token = await localStorageHelper.retrieveItem(key: "token");

      _mainHeader = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer ${token}",
      };
      print(data);
      response = await post(url, data, headers: _mainHeader);

      if (response.statusCode == 401) {
        logout();
      }

      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response?> postUploadRequest(
      {required String url, required List<int> image}) async {
    try {
      final form = FormData({
        'file': MultipartFile(image, filename: 'avatar.png'),
      });

      Response response;
      // The below request is the same as above.
      response = await post(url, form);

      if (response.statusCode == 401) {
        logout();
      }

      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

// POST METHOD
  Future<Response?> putRequest(
      {required String url, required Map<dynamic, dynamic> data}) async {
    try {
      Response response;

      var token = await localStorageHelper.retrieveItem(key: "token");

      _mainHeader = {
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer ${token}",
      };

      print("--------------------------------------");
      print(baseUrl);
      print(url);
      print(_mainHeader);
      print(data);

      response = await put(url, data, headers: _mainHeader);

      if (response.statusCode == 401) {
        logout();
      }

      print("DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
      print(response.body.toString());
      return response;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }
}

