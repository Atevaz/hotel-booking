# HotelTonight Application
HotelTonight is a mobile application developed using Flutter. It supports both Android and IOS.

HotelTonight is a hotel booking application. It allows the user to find hotels, book hotels, search for specific hotel, and filter hotels by different filterations like: price, location, and facilities.

## Table of contents
- ### [main packages used =>](#main-packages-used)
- ### [Folder structure =>](#folder-structure)
- ### [Screenshots =>](#screenshots)
- ### [Demo video =>](#demo-video)

## Main packages used
- [dio](https://pub.dev/packages/dio) to make integration with API
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) as state management
- [shared_preferences](https://pub.dev/packages/shared_preferences) to handle caching data
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) to make the application responsive
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) to use Google map
- [internet_connection_checker](https://pub.dev/packages/internet_connection_checker) to handle internet connection 
- [get_it](https://pub.dev/packages/get_it) to make dependency injection
- [location](https://pub.dev/packages/location) to get user's location
- [image_picker](https://pub.dev/packages/image_picker) to pick image from mobile storage
- [easy_localization](https://pub.dev/packages/easy_localization) to handle localization

## Folder structure
We have applied clean archeticture concept and here is the basic folder structure:

core folder structure that flutter provides:

```
hotel-booking
├── android
├── assets
├── build
├── ios
├── lib
└── test
```

Here is the folder structure we have been using in this project:
```
lib
├── business_logic
├── core
├── data
├── presentation
└── main.dart
```

### business_logic
This folder containes the business logic of the application specificly state management.

```
business_logic
├── booking_cubit
├── global_cubit
├── hotel_cubit
├── user_cubit
├── bloc_observer.dart
└── business_logic.dart
```

### core
This folder contains all services and tools related to the application
```
core
├── constant               
├── di                      
├── dio_service             
├── exceptions             
├── network_service         
├── router                  
├── shared_preferences      
├── styles                  
└── utils                   
```

### data
This folder contains all data and operations done to that data
```
data
├── local
├── model
├── remote
└── repository
```

### presentation
This folder containes everything related to the screen of the application.
```
presentation
├── screens
├── view
└── widget
```

## Screenshots
Here are some screeshots for the application
|<img src="https://user-images.githubusercontent.com/76849157/192920986-85e44363-cbb4-41eb-9325-8bc4bb3511e7.jpg" width="300"> | <img src="https://user-images.githubusercontent.com/76849157/192922192-88a90927-8138-4d72-a52c-1d85594c3d1e.jpg" width="300"> | <img src="https://user-images.githubusercontent.com/76849157/192923848-9b1d190d-3d71-4117-bdab-4aecb54ce9c8.jpg" width="300"> |
--- |---|---
|<img src="https://user-images.githubusercontent.com/76849157/192925152-47132136-5e47-4553-bdd0-06b5110e67d5.jpg" width ="300">|<img src="https://user-images.githubusercontent.com/76849157/192925474-a5bf9082-1fbe-47e3-b71b-a16fc144cb5e.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192925493-29957d00-0328-4434-b614-f4c97b78f6ce.jpg" width="300">|
|<img src="https://user-images.githubusercontent.com/76849157/192925695-12473133-a4ae-4d5c-b0d6-e434bb8da8c9.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192925722-670bdc88-67c9-4524-a572-24b994aae742.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192925740-82b91dba-806a-4141-a406-f2d7b414180c.jpg" width="300">|
|<img src="https://user-images.githubusercontent.com/76849157/192925763-fcae5ec8-926f-4d2a-b156-c053b99068ff.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192925853-affba4df-52cf-4da8-a29a-28b211a280b8.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192925872-45cd65a6-1299-4669-8b44-d9d9e822b26f.jpg" width="300">|
|<img src="https://user-images.githubusercontent.com/76849157/192925889-2dc62026-5ec1-4d1f-9521-cbadc209f297.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192925907-21afde0a-8e70-45cd-94d0-31e1bb9f4020.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192926056-2db7c9c0-87f0-4ce8-877a-d8e27b3578a0.jpg" width="300">|
|<img src="https://user-images.githubusercontent.com/76849157/192926146-413219d1-6b91-4f95-8a59-da6b9b111b5d.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192926078-247e69df-cbfb-4a2e-a604-6b293ff0a2d4.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192926246-7e2c4b0b-3ac8-46ce-9f4b-f6026fe9966e.jpg" width="300">|
|<img src="https://user-images.githubusercontent.com/76849157/192926301-3af6e9e6-3601-422c-b2b7-fe136f6d3298.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192927303-078dab11-bbe9-48b4-9d00-6fd66300d093.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192926311-2efdbe0a-0bc2-4121-8bc2-2c2286ce44ea.jpg" width="300">|
|<img src="https://user-images.githubusercontent.com/76849157/192926342-b3c3ffe9-e719-4662-a547-88f04235067e.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192926350-69bd98c7-2b7e-429d-9bf1-04d8a0dfe239.jpg" width="300">|<img src="https://user-images.githubusercontent.com/76849157/192926361-192174cd-b069-4aae-8a3b-70615261e212.jpg" width="300">|

## Demo Video

https://user-images.githubusercontent.com/76849157/193379725-e6e5ad68-cc3d-4199-822a-1337da8e22a5.mp4

