#include <fstream>
#include <string>

std::string password, ssid;

// Read the .env file
// the file contains:
// ssid
// password

/*
Create an environment file from terminal with the following command
- touch .env
- echo "ssid">>.env
- echo "password">>.env
*/

void getEnvironmentVariables()
{
  std::fstream file;
  file.open(".env");
  if (file.is_open())
  {
    while (file.good())
    {
      getline(file, ssid);
      getline(file, password);
    }
  }
}
