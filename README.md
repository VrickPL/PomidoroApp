<h1 align="center">
PomidoroApp
</h1>
<h3 align="center">
Mobile iOS app for Pomodoro.
</h3>
<br>


**Pomidoro** is a sleek app designed to boost productivity with the [Pomodoro Technique](https://en.wikipedia.org/wiki/Pomodoro_Technique). Its intuitive interface is perfect for both beginners and pros. Customize your work and break intervals, receive timely notifications to stay on track, and enjoy the motivating charm of a growing tomato icons as you progress through your tasks! Whether your phone is locked or the app is not open, you can trust that your timer is still running.





## Table of contents 
- [Used technologies and libraries](https://github.com/VrickPL/PomidoroApp/tree/feature/readme?tab=readme-ov-file#used-technologies-and-libraries)
- [Splash Screen](https://github.com/VrickPL/PomidoroApp/tree/feature/readme?tab=readme-ov-file#splash-screen)
- [Pomidoro](https://github.com/VrickPL/PomidoroApp/tree/feature/readme?tab=readme-ov-file#pomidoro)
- [Timer logic](https://github.com/VrickPL/PomidoroApp/tree/feature/readme?tab=readme-ov-file#timer-logic)
- [Settings](https://github.com/VrickPL/PomidoroApp/tree/feature/readme?tab=readme-ov-file#settings)





## Used technologies and libraries
- **[Swift](https://www.swift.org/documentation/)**,  
- **[SwiftUI](https://developer.apple.com/tutorials/swiftui)**,
- **[UserNotifications](https://developer.apple.com/documentation/usernotifications/)**
- **[Timer](https://developer.apple.com/documentation/foundation/timer)**

Project has been written in **MVVM** pattern.





## Splash Screen
// photo






## Pomidoro
The main screen is **simple and intuitive**. It features a *modern, sleek design* that is easy to understand. You'll enjoy subdued colors for both light and dark modes, along with clearly labeled buttons to manage your **timer**. Plus, there are beautiful icons of growing tomatoes to motivate you to keep going. When you see a tomato growing, you’ll be reminded of your *growing knowledge*—so you won’t want to give up!
<br>
<br>
You can **start**, **stop**, **reset**, or **skip** your current mode with ease. Just keep pushing forward, because *your goal is closer than you think!*


// photos

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





## Settings
In Settings you can adjust:
- **Work and Break Time**: Select your preferred durations for both work and break intervals.
- **Language**: Choose between English, Polish, or let the app automatically detect your preference.
- **Theme**: Switch between Dark Mode, Light Mode, or set it to Auto to adapt to system settings.
- **Haptics**: Enable or disable phone vibrations.

All your selections will be securely stored in **AppStorage** for convenience.

In this section, you can also find my **GitHub** and **LinkedIn** profiles. 


// photos
