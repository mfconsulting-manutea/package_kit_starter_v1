import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:package_kit_starter_v1/sendinblue/data/repositories/sendinblue_repository.dart';

part 'sendinblue_state.dart';

class SendinblueCubit extends Cubit<SendinblueState> {
  // final String apiKey;
  late SendinblueRepository sendinblueRepository;

  SendinblueCubit({
    // required this.apiKey,
    required this.sendinblueRepository,
  }) : super(SendinblueInitial());

  sendTransactionalEmail({required Map<String, dynamic> mapData}) async {
    emit(SendinblueLoading());

    try {
      Response response = await sendinblueRepository.sendTransactionalEmail(data: mapData);
      emit(SendinblueSuccess(response: response));
    } catch (e) {
      emit(SendinblueFailure(message: e.toString()));
    }
  }
}
