AlanData[] adatas;
JSONObject json;

float[] soundArray;
float[] motionArray;
float[] lightArray;
float[] humidityArray;
float[] temperatureArray;
float[] vibrationArray;
int dataNum;

float scaleLen;
float scaleTime;
float startX;
float endX;
float endY;
int y1,y2,y3,y4,y5,y6;

void setup(){
  size(1000, 1000);
  background(255,255,255);
  startX = 300;
//  y1 = 200;
//  y2 = 300;
//  y3 = 400;
//  y4 = 500;
//  y5 = 600;
//  y6 = 700;
  
//  fill(25);
//  textFont(createFont("Georgia", 36));
//  textSize(14);
//  text("Sound",100,y1);
//  text("Motion",100,y2);
//  text("Light",100,y3);
//  text("Humidity",100,y4);
//  text("Temperature",100,y5);
//  text("vibration",100,y6);
  
  scaleLen = 0.3;
  scaleTime = 1;
  
  json = loadJSONObject("adata.json");
  JSONArray aJsonArray = json.getJSONArray("adatas");
  dataNum = int(aJsonArray.size()/scaleTime);

  adatas = new AlanData[dataNum];
  soundArray = new float[dataNum];
  motionArray = new float[dataNum];
  lightArray = new float[dataNum];
  humidityArray = new float[dataNum];
  temperatureArray = new float[dataNum];
  vibrationArray = new float[dataNum];

  for (int i = 0; i < dataNum; i++) {
    JSONObject adata = aJsonArray.getJSONObject(i);
    String timestamp = adata.getString("timestamp");
    float sound = adata.getFloat("sound");
    float motion = adata.getFloat("motion");
    float light = adata.getFloat("light");
    float humidity = adata.getFloat("humidity");
    float temperature = adata.getFloat("temperature");
    float vibration = adata.getFloat("vibration");

    // println("timestamp: "+timestamp+", sound:"+sound+", motion:"+motion+", light:"+light+", humidity:"+humidity+", temperature:"+temperature+", vibration:"+vibration);
    // adatas[i] = new AlanData(timestamp,sound,motion,light,humidity,temperature,vibration);

    soundArray[i] = sound;
    motionArray[i] = motion;
    lightArray[i] = light;
    humidityArray[i] = humidity;
    temperatureArray[i] = temperature;
    vibrationArray[i] = vibration;

  }
  println("aJsonArray.size = ",dataNum);//total objects: 29821


  noStroke();
  smooth();
  
  
  //sound
  fill(99,209,228);
  beginShape();
  float r = 20;
  float a = 500;
  float b = 500-r;
  float inR = 300;
  vertex(a,b-inR);
  for (int i = 0; i < dataNum; ++i) {
    float theta = ((360*i)/dataNum)*TWO_PI/360;
    float R = inR+r*soundArray[i]/200;
    float tmpX = a+sin(theta)*R;
    float tmpY = b+r-cos(theta)*R;
//    println("  theta:"+theta+"  R:"+R);
    vertex(tmpX,tmpY);
//    println("tmpX:"+tmpX+" tmpY:"+tmpY);
    endX = tmpX;
    endY = tmpY;
  }

  endShape(CLOSE);
  
  //print a white circle inside
  fill(255,255,255);
  ellipse(500,500,580,580);


  //light
  fill(238,246,70);
  beginShape();
    float r2 = 20;
    float a2 = 500;
    float b2 = 500-r2;
    float inR2 = 200;
    vertex(a2,b2-inR2);
  for (int i = 0; i < dataNum; ++i) {
    float theta2 = ((360*i)/dataNum)*TWO_PI/360;
    float R2 = inR2+r2*lightArray[i]/30;
    float tmpX = a2+sin(theta2)*R2;
    float tmpY = b2+r-cos(theta2)*R2;
    println("  theta2:"+theta2+"  R2:"+R2);
    vertex(tmpX,tmpY);
//    println("tmpX:"+tmpX+" tmpY:"+tmpY);
    endX = tmpX;
  }
  endShape(CLOSE);
  
    //print a white circle inside
  fill(255,255,255);
  ellipse(500,500,320,320);



  //motion
  fill(127,220,178);
  beginShape();
  float r3 = 40;
  float a3 = 500;
  float b3 = 500-r3;
  float inR3 = 100;
  vertex(a3,b3-inR3);
  for (int i = 0; i < dataNum; ++i) {
    float theta3 = ((360*i)/dataNum)*TWO_PI/360;
    float R3 = inR3+r3*motionArray[i];
    float tmpX = a3+sin(theta3)*R3;
    float tmpY = b3+r3-cos(theta3)*R3;
//    println("  theta:"+theta+"  R:"+R);
    vertex(tmpX,tmpY);
//    println("tmpX:"+tmpX+" tmpY:"+tmpY);
    endX = tmpX;
    endY = tmpY;
  }

  endShape(CLOSE);
  
  //print a white circle inside
  fill(255,255,255);
  ellipse(500,500,180,180);



}




