class AlanData{
  String timestamp;
  float sound;//0~1024
  float motion;//0~1
  float light;//0~255
  float humidity;//0~255
  float temperature;//0~255
  float vibration;//0~1024
  AlanData(String timestamp,float sound,float motion,float light,float humidity,float temperature,
  float vibration){
    timestamp =  timestamp;
    sound = sound;
    motion = motion;
    light = light;
    humidity = humidity;
    temperature = temperature;
    vibration = vibration;
  }
}
