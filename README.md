# Absence Manager

## Description

A Flutter project showcasing the implementation of the BLoC state management pattern, external API integration for data fetching with pagination, filtering functionality by type and date, and exporting data to the phone calendar.

## Features
- Utilizes the BLoC state management pattern for managing application state.
- Fetches data from an external API with pagination, limiting to 10 items per page.
- Implements filtering functionality by type and date.
- Enables exporting of absence data to the phone calendar.
- Includes basic test cases for ensuring code reliability.

## Screenshots
<p>
<img src="https://github.com/WahibAbdul/Absense-Manager-BLoC/blob/main/screenshots/1.png" alt="Screenshot 1" width="230" height="500">
<img src="https://github.com/WahibAbdul/Absense-Manager-BLoC/blob/main/screenshots/2.png" alt="Screenshot 2" width="230" height="500">
<img src="https://github.com/WahibAbdul/Absense-Manager-BLoC/blob/main/screenshots/3.png" alt="Screenshot 2" width="230" height="500">
<img src="https://github.com/WahibAbdul/Absense-Manager-BLoC/blob/main/screenshots/4.png" alt="Screenshot 2" width="230" height="500">
</p>



## How to Run

1. If Flutter is not installed on your machine, follow these steps to install it:
   - Visit the [Flutter installation guide](https://flutter.dev/docs/get-started/install) for your operating system.
   - Download the Flutter SDK and extract the files to a location on your machine.
   - Add the Flutter `bin` directory to your system's PATH variable.

2. Clone the repository to your local machine: git clone https://github.com/WahibAbdul/Absense-Manager-BLoC.git

3. Navigate to the project directory

4. Install dependencies:
flutter pub get


5. Ensure that an emulator or physical device is connected to your machine.
6. Run the application:
flutter run


## Usage

1. Upon launching the application, you will be presented with a list of absence data fetched from the external API. Pagination is implemented with a limit of 10 items per page.
2. To filter the data by type and/or date, navigate to the filter view and specify the desired criteria.
3. To export an absence to your phone calendar, select the corresponding absence item and follow the prompts to add it to your calendar.

## Testing

1. Navigate to the `test` directory in the project.
2. Run the test cases using the following command:
flutter test













