import 'package:newware_final_project/ui/pages/main/main_cubit.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
class SocketIoConnect{
  MainCubit ?mainCubit;
  int ?userId;
  SocketIoConnect({this.mainCubit,this.userId});
  connectAndListen() {
  IO.Socket socket = IO.io('http://192.168.29.77:3000',
      OptionBuilder()
          .setTransports(['websocket']).build());
    socket.onConnect((_) {
      socket.on("notificationCouter",(data){
       int dataParse = int.parse(data);
       mainCubit?.couterNotify(dataParse);
      });
  });
  socket.onDisconnect((_) => ('disconnect'));
  return socket;
}

}