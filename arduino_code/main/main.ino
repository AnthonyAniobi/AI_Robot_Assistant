#include <Arduino.h>
#include <ESP8266WebServer.h>
#include <FS.h>  
#include <LittleFS.h>
#include "secrets.h"
#include "http_services.h"

#define HOSTNAME "webserver"

ESP8266WebServer server(80);


int main(){
  delay(1000);
  Serial.begin(9600);
  //load environment variables
  Serial.println("Loading environment variables");
  getEnvironmentVariables();
  Serial.println("environment variables loaded!....");
  delay(500);
  //
  WiFi.mode(WIFI_STA);
  // WiFi.begin(ssid, password);// start wifi with password and ssid
  WiFi.begin("oga", "nwanaja1998");// start wifi with password and ssid
  WiFi.setHostname(HOSTNAME);//
  Serial.println("Connecting");
  while(WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(" - ");
  }
  Serial.println(" Connected!! ");
  // setup endpoints
  HttpServices service();
  server.on("/", HTTP_GET, service.home(server));
  // server.on("/", HTTP_GET, handleSysInfo);
  server.begin();
  while(true){
    server.handleClient();
  }
  return 0;
}