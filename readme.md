

CondeNast_Akhilesh

Swift Version 5

Build and Runtime Requirements
Xcode 13 or later
iOS 15.2 or later
MacOS BigSur Version 11.5.2

Configuring the Project
Configuring the Xcode project requires a few steps in Xcode 
1. Configure each iOS device you plan to test with an iCloud account. Create or use an existing Apple ID account that supports iCloud.
2. Configure the Team for each target within the project.
3. Open the project in the Project navigator within Xcode and select each of the targets. Set the Team on the General tab to the team associated with your developer account.
4. Change the Bundle Identifier.


About CondeNast_Akhilesh
CondeNast_Akhilesh is a CocoaTouch productivity sample code project for iOS. In this sample, the user can see Top Us news Headlines in list and if user clicks on the list, he can see the respective news.


Unit Tests
CondeNast_Akhilesh has unit tests written for the ViewCController and TopUsHeadlineResponse classes. These tests are in the CondeNast_AkhileshTests group. The tests can be run on an iOS target. To run the unit tests, Go to APIHelperTests or ViewControllerTests. Then hold the Run button down and select the test functions like: testTopUSHeadline or testVCLoad.
