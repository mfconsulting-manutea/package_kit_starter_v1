import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit() : super(ConnectivityInitial());

  checkConnectivity() async {
    emit(ConnectivityLoading());

    try {
      ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.ethernet) {
        emit(ConnectivitySuccess(isConnected: true));
      } else {
        emit(ConnectivitySuccess(isConnected: false));
      }
    } catch (e) {
      emit(ConnectivityFailure(message: e.toString()));
    }
  }
}
