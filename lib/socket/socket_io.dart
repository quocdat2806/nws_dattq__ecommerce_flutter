import 'package:newware_final_project/ui/pages/main/main_cubit.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
class SocketIoConnect {
  MainCubit? mainCubit;
  SocketIoConnect({this.mainCubit});
  connectAndListen() {
    IO.Socket socket = IO.io(
      'https://backend-newware.onrender.com',
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.onConnect((_) {
      socket.on("notificationCouter", (quantityNotify) {
        int notify = int.parse(quantityNotify);
        mainCubit?.setQuantityNotify(notify);
      });
    });
    socket.onDisconnect((_) => ('disconnect'));
    return socket;
  }
}
