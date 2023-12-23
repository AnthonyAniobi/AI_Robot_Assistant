# AI Robot Assistant

This is an robot assistant which makes use of AI models built using Tensorflow and a customizable remote controller which configures the assistant based on the state of the robot and the command from the remote. The system makes use of wifi signal intensity to gauge the distance from the source of the remote. This allows the remote to callback the robot and the robot returns to the area of highest wifi signal which is the location of the remote.

## Modules

- ESP8266 Node module
- Ultrasonic sensor

## Notes

I intend to use just a few sensors for this project and am currently exploring position tracking witht the use the intensity of the wifi signal.
The mobile device performs computation on the signals and data gotten from the microntroller and controls the movement and functionality of the device
The mobile device makes use of ai models. Further AI models can be added to the device. The user decides how the AI model should interact with the data from the microntroler and the
