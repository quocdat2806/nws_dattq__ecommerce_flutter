class ConfigHeaderRequestApi{

 static  Map<String,String>requestHeaders({token}){
    return  {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }


}