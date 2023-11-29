import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc_validation/form_validation/screens/sign_in/sign_in_bloc/sign_in_event.dart';
import 'package:flutter_bloc_validation/form_validation/screens/sign_in/sign_in_bloc/sign_in_state.dart';


class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(): super(SignInInitialState()) {


    on<SignInTextChangeEvent>((event, emit) {
      if(EmailValidator.validate(event.emailValue) == false){
        emit(SignInErrorState("Please enter a valid email address"));
      }else if (event.passwordValue.length <= 8){
        emit(SignInErrorState("Please enter a valid password"));
      }else{
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}