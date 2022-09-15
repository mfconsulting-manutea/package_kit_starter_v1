part of 'connectivity_cubit.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class ConnectivityLoading extends ConnectivityState {}

class ConnectivityFailure extends ConnectivityState {
  final String message;

  ConnectivityFailure({
    required this.message,
  });
}

class ConnectivitySuccess extends ConnectivityState {
  final bool isConnected;

  ConnectivitySuccess({
    required this.isConnected,
  });
}
