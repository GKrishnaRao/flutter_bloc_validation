// For error state
// for invalid state of button
// for valid state of button and textfield valid
// Initial state

abstract class SignInState{}

class SignInInitialState extends SignInState {} // initial state

class SignInValidState extends SignInState {} // Sign in valid state

class SignInErrorState extends SignInState {
  final String errorMessage;
  SignInErrorState(this.errorMessage); // Error state
}

class SignInLoadingState extends SignInState {}  // Loading state

