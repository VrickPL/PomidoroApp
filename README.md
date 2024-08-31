<h1 align="center">
PomidoroApp
</h1>
<h3 align="center">
Mobile iOS app for Pomodoro.
</h3>
<br>


**Pomidoro** is a sleek app designed to boost productivity with the [Pomodoro Technique](https://en.wikipedia.org/wiki/Pomodoro_Technique). Its intuitive interface is perfect for both beginners and pros. Customize your work and break intervals, receive timely notifications to stay on track, and enjoy the motivating charm of a growing tomato icons as you progress through your tasks! Whether your phone is locked or the app is not open, you can trust that your timer is still running. The app's classes have been thoroughly covered with unit tests, ensuring reliability and stability in its core functionality. Built using the MVVM architecture.





## Table of contents 
- [Used technologies and libraries](https://github.com/VrickPL/PomidoroApp/tree/main?tab=readme-ov-file#used-technologies-and-libraries)
- [Splash Screen](https://github.com/VrickPL/PomidoroApp/tree/main?tab=readme-ov-file#splash-screen)
- [Pomidoro](https://github.com/VrickPL/PomidoroApp/tree/main?tab=readme-ov-file#pomidoro)
- [Timer logic](https://github.com/VrickPL/PomidoroApp/tree/main?tab=readme-ov-file#timer-logic)
- [Settings](https://github.com/VrickPL/PomidoroApp/tree/main?tab=readme-ov-file#settings)





## Used technologies and libraries
- **[Swift](https://www.swift.org/documentation/)**,  
- **[SwiftUI](https://developer.apple.com/tutorials/swiftui)**,
- **[UserNotifications](https://developer.apple.com/documentation/usernotifications/)**,
- **[Swift Testing](https://developer.apple.com/xcode/swift-testing/)**, 
- **[Timer](https://developer.apple.com/documentation/foundation/timer)**




## Splash Screen

<p align="center"> 
<img src="https://github.com/user-attachments/assets/6251f170-0414-4682-96b0-150a252105d4" width="310" height="660">
</p>




## Pomidoro
The main screen is **simple and intuitive**. It features a *modern, sleek design* that is easy to understand. You'll enjoy subdued colors for both light and dark modes, along with clearly labeled buttons to manage your **timer**. Plus, there are beautiful icons of growing tomatoes to motivate you to keep going. When you see a tomato growing, you’ll be reminded of your *growing knowledge*—so you won’t want to give up!
<br>
<br>
You can **start**, **stop**, **reset**, or **skip** your current mode with ease. Just keep pushing forward, because *your goal is closer than you think!*


<p align="center"> 
<img src="https://github.com/user-attachments/assets/a099a995-9d81-4124-98ee-5eefda8477d4" width="310" height="660">
<img src="https://github.com/user-attachments/assets/ad5994eb-bc6b-47a8-b096-1e02eb5a38ae" width="310" height="660">
</p>

<p align="center"> 
<img src="https://github.com/user-attachments/assets/7e53dd8a-2a2a-42b0-9002-aa6c696b91a0" width="310" height="660">
<img src="https://github.com/user-attachments/assets/16b4d55f-a586-41b7-adf1-b83906fd123c" width="310" height="660">
</p>

<br>
<p align="center"><i>All icons were drawn by my girlfriend.</i></p>





## Timer logic
The timer updates every second while the app is open. If you close the app or turn off your phone, *don't worry*—the timer keeps running in the background. When you reopen the app, **the timer will continue** where it left off. If the countdown finishes while you're away, **you'll receive a notification** and the timer will automatically switch to the next mode. Simply return to the app to resume!
<br>
<br>
If you adjust the time settings while the timer is active, **the timer will reset** to reflect your new preferences.
<br>
<br>
If you stop the timer and close the app, **the app will remember your progress**, so when you return, you'll pick up right where you left off. *Smart, right?*
<br>
<br>
Extensive **unit testing** has been applied to ensure the code is free of bugs.

<p align="center"> 
<img src="https://github.com/user-attachments/assets/8c90c6e2-9c10-4773-bab0-7d65f3ba1900" width="400" height="105">
</p>





## Settings
In Settings you can adjust:
- **Work and Break Time**: Select your preferred durations for both work and break intervals.
- **Language**: Choose between English, Polish, or let the app automatically detect your preference.
- **Theme**: Switch between Dark Mode, Light Mode, or set it to Auto to adapt to system settings.
- **Haptics**: Enable or disable phone vibrations.

All your selections will be securely stored in **AppStorage** for convenience.

In this section, you can also find my **GitHub** and **LinkedIn** profiles. 

<p align="center"> 
<img src="https://github.com/user-attachments/assets/5fa1b1f0-4ef8-4ac3-9546-3843118d63c6" width="310" height="660">
<img src="https://github.com/user-attachments/assets/ec9b8d23-a49c-4c04-ba41-d4218c47e8e8" width="310" height="660">
</p>
