# IssuesReader
IssuesReader is an iOS app that parses a csv file and shows content in a TableView

# AppOverView
- IssuesReader is using the SwiftCSV Library to parse the CSV file
	- https://github.com/swiftcsv/SwiftCSV

- IssuesReader parse the file content for the first time and then store it locally to avoid parsing every time the app is opened

- IssuesReader will try to fetch the data from the local storage first and if data doesn't exist it will start the process of parsing the file from the beginning and then save it locally for future use.


# Technical Details
- The app is using these third party libraries using CocoaPods:
	- *SwiftCSV* for parsing CSV file
	- *Quick n Nimble* for Unit testing
	- I've checked in the pods in the repo so no need to run pod install on the first checkout, but please open the project from the "IssuesReader.xcworkspace" file 
- The app is build using Swift 5
- Using Xcode version is 10.3
- Deployment target is 12.4


# Code Details
- I've used MVP pattern for this project, I know its fairly simple App and probably MVC will do
but I needed to show some structure in the code, also MVP allowed me to separate some logic into the presenter
instead of having a huge ViewControllers.
  - Also, Using MVVM or VIPER, ...etc would be an overkill for this App

- print statements exist in the App for logging purposes, optimally I would replace them with better logging system.
