import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/socket/socket_io.dart';
part 'main_state.dart';
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());
  void handleSwitchTap(int index) {
    emit(
      state.copyWith(
        selectedIndex: index,
      ),
    );
  }
  void setQuantityNotify(int couterNotify){
    emit(
      state.copyWith(
        quantityNotify: couterNotify,
      ),
    );

  }
  void clearNotify(){
    var socket = SocketIoConnect().connectAndListen();
    if (socket.connected) {
      socket.emit('viewNotification');
    }
    emit(
      state.copyWith(
        quantityNotify: 0,
      ),
    );
  }
}
