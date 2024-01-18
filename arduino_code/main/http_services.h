#include <ESP8266WebServer.h>
#include <string>

class HttpServices
{
public:
  void home(ESP8266WebServer server)
  {
    String result;
    result += jsonStart;
    result += keyValue("flashSize", ESP.getFlashChipSize());
    result += keyValue("freeHeap", ESP.getFreeHeap());
    result += jsonEnd;

    server.sendHeader("Cache-Control", "no-cache");
    server.send(200, "text/javascript; charset=utf-8", result);
  }

private:
  ESP8266WebServer server;
  const std::string jsonStart = "{\n";
  const std::string jsonEnd = "}";
  // set key value pairs
  std::string keyValue(std::string key, double value)
  {
    return "  \"" + key + "\": " + std::to_string(value) + ",\n";
  }
  std::string keyValue(std::string key, long value)
  {
    return "  \"" + key + "\": " + std::to_string(value) + ",\n";
  }
  std::string keyValue(std::string key, uint32_t value)
  {
    return "  \"" + key + "\": " + std::to_string(value) + ",\n";
  }
}