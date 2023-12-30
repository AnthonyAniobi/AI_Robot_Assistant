# AI Robot Assistant

This is an robot assistant which makes use of AI models built using Tensorflow and a customizable remote controller which configures the assistant based on the state of the robot and the command from the remote. The system makes use of wifi signal intensity to gauge the distance from the source of the remote. This allows the remote to callback the robot and the robot returns to the area of highest wifi signal which is the location of the remote.

## Modules

- ESP8266 Node module
- Ultrasonic sensor


## Project Description

### Android App
The project makes use of the following libraries:
- Wifi IOT
- Wifi Scan
The project uses a gradle version of 18.1 this is to enable android support for scanning wifi connections. Also, an android sdk version of 26 and above is required for development of wifi functionality on Flutter. The statemanagement used for the project is `bloc`.

***Homepage**: This page allows the user to connect various Wifi Access Points.

<img src='./images/home1.png' width='100'>|
<img src='./images/home2.png' width='100'>|
<img src='./images/home3.png' width='100'>|

## Notes

I intend to use just a few sensors for this project and am currently exploring position tracking witht the use the intensity of the wifi signal.
The mobile device performs computation on the signals and data gotten from the microntroller and controls the movement and functionality of the device
The mobile device makes use of ai models. Further AI models can be added to the device. The user decides how the AI model should interact with the data from the microntroler and the
