part of 'sendinblue_cubit.dart';

@immutable
abstract class SendinblueState {}

class SendinblueInitial extends SendinblueState {}

class SendinblueLoading extends SendinblueState {}

class SendinblueFailure extends SendinblueState {
  final String message;

  SendinblueFailure({
    required this.message,
  });
}

class SendinblueSuccess extends SendinblueState {
  Map<String, dynamic> response;

  SendinblueSuccess({
    required this.response,
  });
}
