import 'package:ecommerce_app/models/login/LoginRequest.dart';
import 'package:ecommerce_app/utils/endpoints.dart';
import 'package:get/get.dart';

import '../../models/signup/SignupRequest.dart';
import '../api/api_client.dart';

class ProductsRepository extends GetxService {
  ApiClient apiClient = ApiClient(appbaseurl: Endpoints.FAKEAPI_BASE_URL);

  Future<Response?> login(LoginRequest body) async {
    String url = Endpoints.LOGIN;
    return apiClient.postRequest(url: url, data: body.toJson());
  }

  Future<Response?> signup(SignupRequest body) async {
    String url = Endpoints.REGISTER;
    return apiClient.postRequest(url: url, data: body.toJson());
  }

  Future<Response?> verifyOtp(String otp) async {
    String url = Endpoints.VERIFY_OTP;
    return apiClient.getRequest(url: "$url$otp");
  }

  Future<Response?> loadProducts() async {
    String url = Endpoints.LOAD_PRODUCTS;
    return apiClient.getRequest(url: url);
  }

}
