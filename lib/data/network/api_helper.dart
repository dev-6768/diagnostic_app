import 'dart:convert';

import 'package:diagnostic_app/const/app_urls.dart';
import 'package:diagnostic_app/data/model/about_us_model.dart';
import 'package:diagnostic_app/data/model/appointment_booking_model.dart';
import 'package:diagnostic_app/data/model/carousel_model.dart';
import 'package:diagnostic_app/data/model/change_password_model.dart';
import 'package:diagnostic_app/data/model/checkout_model.dart';
import 'package:diagnostic_app/data/model/contact_details_model.dart';
import 'package:diagnostic_app/data/model/delete_cart_response_model.dart';
import 'package:diagnostic_app/data/model/forgot_password_model.dart';
import 'package:diagnostic_app/data/model/home_collection_booking_model.dart';
import 'package:diagnostic_app/data/model/home_collection_test_model.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/data/model/order_report_model.dart';
import 'package:diagnostic_app/data/model/order_tracking_model.dart';
import 'package:diagnostic_app/data/model/orders_model.dart';
import 'package:diagnostic_app/data/model/pathology_test_model.dart';
import 'package:diagnostic_app/data/model/routine_test_model.dart';
import 'package:diagnostic_app/data/model/signup_page_model.dart';
import 'package:diagnostic_app/data/model/update_cart_response_model.dart';
import 'package:diagnostic_app/data/model/add_to_cart_model.dart';
import 'package:diagnostic_app/data/model/view_cart_model.dart';
import 'package:diagnostic_app/data/model/edit_profile_model.dart';
import 'package:diagnostic_app/shared/exception/base_exception.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

class ApiHelper {
  final Dio dio;

  ApiHelper({required this.dio});

  //get carousel
  Future<Result<CarouselModel, APIException>> getCarousel() async {
    final result = await dio.get(AppUrls.getCarousel);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(CarouselModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  //get routine test
  Future<Result<RoutineTestModel, APIException>> getRoutineTest() async {
    final result = await dio.get(AppUrls.getRoutineTest);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(RoutineTestModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  //get pathology test
  Future<Result<PathologyTestModel, APIException>> getPathologyTest() async {
    final result = await dio.get(AppUrls.getPathoTest);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(PathologyTestModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  //get about us
  Future<Result<AboutUsModel, APIException>> getAboutUs() async {
    final result = await dio.get(AppUrls.getAboutUs);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(AboutUsModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  //get about us
  Future<Result<ContactDetailsModel, APIException>> getContactDetails() async {
    final result = await dio.get(AppUrls.getContactDetails);
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(ContactDetailsModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  //view cart
  Future<Result<ViewCartModel, APIException>> getCart(String userId, String uniqueId) async {
    final result = await dio.get('/webservice/service.php?action=view_cart&user_id=$userId&unique_id=$uniqueId');
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(ViewCartModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  //delete cart
  Future<Result<DeleteCartResponseModel, APIException>> deleteCart({required int cartId}) async {
    final result = await dio.get("${AppUrls.deleteCart}=$cartId");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(DeleteCartResponseModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  //update cart
  Future<Result<UpdateCartResponseModel, APIException>> updateCart({required int cartId, required int quantity}) async {
    final result = await dio.get("/webservice/service.php?action=update_item&cart_id=$cartId&user_id=1&quantity=$quantity&isCartAdd=1");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(UpdateCartResponseModel.fromMap(parsedJson));
    } else {
      return Error(APIException.fromMap(result.data));
    }
  }

  Future<Result<AddToCartResponseModel, APIException>> addToCart({required int quantity, required double price, required String testName, required String userId, required String uniqueId}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=add_to_cart&user_id=$userId&unique_id=$uniqueId&test_name=$testName&quantity=$quantity&test_price=$price");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(AddToCartResponseModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }


  Future<Result<LoginPageModel, APIException>> loginUser({required String userName, required String password, required String uniqueId}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=login&user_name=$userName&password=$password&unique_id=$uniqueId");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(LoginPageModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }


  Future<Result<SignupPageModel, APIException>> signupUser({
      required String fName,
      required String lName,
      required String email,
      required String phone,
      required String password,
      required String confirmPassword,
      required String address,
      required String city,
      required String state,
      required String zip,
      required String uniqueId,
    }) async {
    final result = await dio.get(
      "https://sanitascare.health/webservice/service.php?action=registration&fname=$fName&lname=$lName&email=$email&phone=$phone&password=$password&confirm_password=$confirmPassword&address=$address&city=$city&state=$state&zip=$zip&unique_id=$uniqueId"
    );
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(SignupPageModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }


  Future<Result<ForgotPasswordModel, APIException>> forgotPassword({required String email}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=forgot_password&email=$email");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(ForgotPasswordModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }

  Future<Result<ChangePasswordModel, APIException>> changePassword({required String currentPassword, required String newPassword, required String confirmPassword, required String userId}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=change_password&old_password=$currentPassword&new_password=$newPassword&confirm_password=$confirmPassword&user_id=$userId");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(ChangePasswordModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }

  Future<Result<CheckoutModel, APIException>> checkoutAction({required String fName, required String lName, required String email, required String phone, required String address, required String city, required String state}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=checkout&fname=$fName&lname=$lName&email=$email&phone=$phone&address=$address&city=$city&state=$state");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(CheckoutModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }

  Future<Result<AppointmentBookingModel, APIException>> appointmentBooking({required String name, required String email, required String phone, required String doctorName, required String date}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=appointment_booking&name=$name&email=$email&phone=$phone&doctor_name=$doctorName&appointment_date=$date");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(AppointmentBookingModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }

  Future<Result<HomeCollectionBookingTestModel, APIException>> homeCollectionTestBooking({required String name, required String email, required String phone, required String testName}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=home_collection&name=$name&email=$email&phone=$phone&test_name=$testName");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(HomeCollectionBookingTestModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }

  Future<Result<HomeCollectionBookingModel, APIException>> homeCollectionBooking({required String name, required String email, required String phone}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=home_collection&name=$name&email=$email&phone=$phone");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(HomeCollectionBookingModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }


  //order api endpoint
  Future<Result<OrderDataModel, APIException>> userOrders({required String userId}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=my_orders&user_id=$userId");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(OrderDataModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }

  Future<Result<TrackDataModel, APIException>> userOrderTracking({required String userId, required String orderId}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=tracking&user_id=$userId&order_id=$orderId");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(TrackDataModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }



  Future<Result<ReportDataModel, APIException>> userOrderReport({required String userId, required String orderId}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=reports&user_id=$userId&order_id=$orderId");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(ReportDataModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }


  Future<Result<EditProfileModel, APIException>> editUserProfile({required String fName, required String lName, required String email, required String phone, required String address, required String city, required String state, required String zip, required String userId}) async {
    final result = await dio.get("https://sanitascare.health/webservice/service.php?action=edit_profile&fname=$fName&lname=$lName&email=$email&phone=$phone&address=$address&city=$city&state=$state&zip=$zip&user_id=$userId");
    if (result.statusCode == 200 || result.statusCode == 201) {
      final parsedJson = jsonDecode(result.data);
      return Success(EditProfileModel.fromMap(parsedJson));
    } 
    
    else {
      return Error(APIException.fromMap(result.data));
    }
  }

  

}

/*
class ProductMessage implements BaseMessage {
  @override
  final String? role;
  ProductModel? _content;
  @override
  final dynamic refusal;

  @override
  ProductModel? get content => _content;

  set content(dynamic value) {
    if (value is String) {
      try {
        final parsedJson = jsonDecode(value);
        _content = ProductModel.fromMap(parsedJson);
      } catch (e) {
        _content = null;
      }
    } else if (value is ProductModel) {
      _content = value;
    } else {
      _content = null;
    }
  }

  ProductMessage({
    this.role,
    dynamic content,
    this.refusal,
  }) {
    this.content = content;
  }

  factory ProductMessage.fromMap(Map<String, dynamic> json) => ProductMessage(
        role: json["role"],
        content: json["content"],
        refusal: json["refusal"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "role": role,
        "content": _content?.toJson(),
        "refusal": refusal,
      };
}
*/
