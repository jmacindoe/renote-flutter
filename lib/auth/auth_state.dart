abstract class AuthState {
  const AuthState();
}

class Uninitialized extends AuthState {}

class Authenticated extends AuthState {
  final String userId;

  const Authenticated(this.userId);

  @override
  String toString() => 'Authenticated userId: $userId';
}

class AuthError extends AuthState {}
