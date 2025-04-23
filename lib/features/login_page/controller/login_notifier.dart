import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/data/model/login_page_model.dart';
import 'package:diagnostic_app/features/login_page/controller/login_user_pod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier to handle login logic


enum LoginStatus { idle, loading, success, error }


class UserDetailsNotifier extends StateNotifier<LoginPageModel> {
  UserDetailsNotifier() : super(LoginPageModel()); // initial value

  void set(LoginPageModel response) => state = response;
  
  void clear() => state = LoginPageModel();
  
  bool isLoggedIn() {
    if(state.loginData == null || state.ack == null || state.msg == null) {
      return false;
    }
    return true;
  }


  LoginPageModel getLoginDetails() {
    return state;
  }
}


final userDetailsProvider = StateNotifierProvider<UserDetailsNotifier, LoginPageModel>(
  (ref) => UserDetailsNotifier(),
);


class LoginState {
  final LoginStatus status;
  final String? error;

  const LoginState({this.status = LoginStatus.idle, this.error});

  LoginState copyWith({LoginStatus? status, String? error}) {
    return LoginState(
      status: status ?? this.status,
      error: error,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(const LoginState());

  Future<void> login(String email, String password, String uniqueId, WidgetRef ref) async {
    state = state.copyWith(status: LoginStatus.loading);
    
    final response = await ref.read(loginUserProvider(LoginUserData(userName: email, password: password, uniqueId: uniqueId)).future);
    ref.read(userDetailsProvider.notifier).set(response);
    
    await Future.delayed(const Duration(seconds: 2)); // simulate API call

    // dummy validation
    if (response.loginData != null && response.loginData!.isNotEmpty) {
      talker.debug("User logged in successfully.");
      talker.debug(response.loginData.toString());
      ref.read(userDetailsProvider.notifier).set(response);
      state = state.copyWith(
        status: LoginStatus.success
      );
    }
    
    else {
      talker.debug("User login failed.");
      state = state.copyWith(
        status: LoginStatus.error,
        error: 'Invalid credentials',
      );
    }
  }

  void reset() {
    state = const LoginState();
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(),
);