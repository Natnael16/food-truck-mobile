# FoodTruck Mobile App 🍔🚚

Welcome to FoodTruck, a Flutter-based mobile application that helps users find food trucks from anywhere in San Francisco. The app utilizes location services and sophisticated search functionality to provide users with a convenient way to discover and explore food options on the go.

## Installation and Setup

To get started with FoodTruck Mobile App, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have Flutter installed. If not, follow the [official installation guide](https://flutter.dev/docs/get-started/install).
3. Run `flutter pub get` to install dependencies.
4. Ensure you have an emulator or a physical device connected.
5. Run `flutter run` to launch the application.

## Pages and Navigation

### Splash Screen
- Displays the app logo and name upon launch.
![splash](https://github.com/Natnael16/food-truck-mobile/assets/91603089/29a1d2a3-1cdd-454d-8ebb-de33d64a909a)


### Location Permission Request
- Requests permission from the user to access their device's location.
![show_ask_permission](https://github.com/Natnael16/food-truck-mobile/assets/91603089/5daeb176-92dc-44d9-9a44-cf9d997f60a0)
![show_location_warning](https://github.com/Natnael16/food-truck-mobile/assets/91603089/555d022b-9a0e-4c84-9013-91ce6b54d5aa)


### Home Page
- The main screen of the app where users can search for food trucks and set filters.
- Includes a radius picker, search bar, toggle button for availability, filter selector, and location button.
![show_home](https://github.com/Natnael16/food-truck-mobile/assets/91603089/e6807cfe-0a51-436c-af90-a7350ce59c2d)
![availabe_search](https://github.com/Natnael16/food-truck-mobile/assets/91603089/d467942a-9779-4c6f-b9e1-53f8517b861f)
![adress_key_word_search](https://github.com/Natnael16/food-truck-mobile/assets/91603089/418c3590-2179-4237-a996-438486341a2a)
![show_radius_filter](https://github.com/Natnael16/food-truck-mobile/assets/91603089/638b944f-0593-4453-a38f-7c3c7d2a990a)
![filter_by_facility](https://github.com/Natnael16/food-truck-mobile/assets/91603089/e383f414-dba3-4081-90a4-1d7b383c9d9f)


### Food Detail Screen
- Displays detailed information about a selected food truck, including name, cuisine type, working hours, and food items served.
![show_detail_page](https://github.com/Natnael16/food-truck-mobile/assets/91603089/406cee4c-e89b-4ab7-a10d-eca7810709ce)
![show_working_hours](https://github.com/Natnael16/food-truck-mobile/assets/91603089/6670609d-1a3f-4f3a-818f-12804eabbba3)


### Bottom Sheet for Available Foods
- Appears when the "Food" button is tapped on the Home Page.
- Shows all available food items in a bottom sheet.
- When a food item is selected, it displays restaurants that serve that specific food.
![food_items](https://github.com/Natnael16/food-truck-mobile/assets/91603089/2bc62507-58a9-4a82-b310-95fbd1e2752f)


## Third-Party Libraries

FoodTruck Mobile App utilizes the following third-party packages:

- `dio`: A powerful HTTP client for making network requests.
- `google_maps_flutter`: Provides Google Maps integration for displaying maps and location services.

## Screenshots

Below are screenshots of the various screens in the FoodTruck Mobile App:

1. Splash Screen ![Splash Screen](splash_screen.png)
2. Location Permission Request ![Location Permission](location_permission.png)
3. Home Page ![Home Page](home_page.png)
4. Food Detail Screen ![Food Detail](food_detail.png)

**Future Enhancements**

- **Chatbot Integration:** Introduce a chatbot to provide interactive guidance and personalized recommendations.
- **Authentication:** Implement user authentication for features like ratings, favorites, and friend sharing.
- **Ratings and Favorites:** Allow users to rate food trucks and mark favorites for a more curated experience.
- **Social Sharing:** Facilitate effortless sharing of food truck discoveries with friends and family.
Feel free to reach out for any assistance or feedback. Happy food truck hunting!
