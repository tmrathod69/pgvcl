import 'dart:convert';

import 'package:bloc22/loginevent.dart';
import 'package:bloc22/loginstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class LoginBloc extends Bloc<LoginEvent,LoginState>
{
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>((event, emit) async
    {
      emit(LoginLoading());

      try {
        final response = await http.post
          (
            Uri.parse("https://prakrutitech.buzz/Fluttertestapi/signin.php"),
            body:
            {
              "email": event.email,
              "password": event.password
            });
        if (response.statusCode == 200) {
          final body = response.body.trim();

          if (body == '0') {
            emit(LoginFailure(error: "Invalid email or password."));
          }
          else {
            final data = json.decode(body);

            if (data is Map<String, dynamic> && data['code'] == 200) {
              emit(LoginSuccess(message: "Login successful!"));
            }
            else {
              emit(LoginFailure(error: "Unexpected response format."));
            }
          }
        }
        else {
          emit(LoginFailure(error: "Server error: ${response.statusCode}"));
        }
      }
      catch (e) {
        emit(LoginFailure(error: "An error occurred: $e"));
      }
    });
  }
}
