import 'package:bloc/bloc.dart';
import 'package:bloc22/signup_event.dart';
import 'package:bloc22/signup_state.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupButtonPressed>((event, emit) async {
      emit(SignupLoading());

      try {
        final response = await http.post(
          Uri.parse('https://prakrutitech.buzz/Fluttertestapi/signup.php'),
          body: {
            'firstname': event.name,
            'email': event.email,
            'password': event.password,
          },
        );

        final body = response.body.trim();

        if (body == '0') {
          emit(SignupFailure(error: "Please fill all fields."));
        } else {
          emit(SignupSuccess(message: "Signup successful!"));
        }
      } catch (e) {
        emit(SignupFailure(error: "An error occurred: $e"));
      }
    });
  }
}
