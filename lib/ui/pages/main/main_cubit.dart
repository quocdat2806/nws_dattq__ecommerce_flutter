import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newware_final_project/socket/socket_io.dart';
part 'main_state.dart';
class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState());
  void switchTap(int index) {
    emit(
      state.copyWith(
        selectedIndex: index,
      ),
    );
  }
  void couterNotify(int data){
    emit(
      state.copyWith(
        couterNotify: data,
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
        couterNotify: 0,
      ),
    );
  }
}
