import codeanticode.syphon.*;

PGraphics canvas;
SyphonClient client;

public void setup() {
  size(480, 340, P3D);
  
  // Create syhpon client to receive frames 
  // from running server with given name: 
  client = new SyphonClient(this, "Simple Server");

  // A Syphon server can be specified by the name of the application that it contains it,
  // its name, or both:
  
  // Only application name.
  //client = new SyphonClient(this, "SendFrames");
  
  // Both application and server names
  //client = new SyphonClient(this, "SendFrames", "Processing Syphon");
  
  // Only server name
  //client = new SyphonClient(this, "", "Processing Syphon");
    
  // An application can have several servers:
  //client = new SyphonClient(this, "Quartz Composer", "Raw Image");
  //client = new SyphonClient(this, "Quartz Composer", "Scene");
  
  
  background(0);
}

public void draw() {  
  if (client.available()) {
    canvas = client.getGraphics(canvas);
    image(canvas, 0, 0, width, height);    
  }  
}

void keyPressed() {
  if (key == ' ') {
    client.stop();  
  } else if (key == 'd') {
    println(client.description());
  }
}