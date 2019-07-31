# IssuesReader
IssuesReader is an iOS app that parses csv file and show content in a TableView

# AppOverView
- IssuesReader is using the SwiftCSV Library to parse the csv file
	- https://github.com/swiftcsv/SwiftCSV

- IssuesReader parse the file content for the first time and then store it locally to avoid parsing everytime the app is opened

- IssuesReader will try to fetch the data from the local storage first and if data doesn't exists it will start the process of parsing the file from the begining and then save it locally for future user.


# Technical Details
- The app is using these thrid party libraries using CocoaPods:
	- *SwiftCSV* for parsing csv file
	- *Quick n Nimble* for Unit testing
	- I've checked in the pods in the repo so no need to run pod install on first checkout, but please open the project from the "IssuesReader.xcworkspace" file 
- The app is build using Swift 5
- Using Xcode version is 10.3
- Deployment target is 12.4


# Code Details
- I've used MVP pattern for this project, I know its fairly simple App and probably MVC will do
but I needed to show some structure in the code, also MVP allowed me to separate some logic into the presenter
instead of having a huge viewcontrollers.
  - Also, Using MVVM or VIPER, ...etc would be an overkill for this App

- print statements exists in the App for logging purposes, optimally I would replace them with better loging system.
