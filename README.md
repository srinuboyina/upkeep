# Overview

This mock application simulates different Upkeep users logging in and seeing work orders data. The project has basic cocoa pods setup.
Upon tapping “Done” button data fetching should happen. Tapping sign out button should log the user out.

A work order in this example represents work assigned to a technicain. The data for comes from backend in a form of a list of objects where each has a title and a description.

As you work on this assignment assume you're writing production ready code, show your craft and your best work.

# Setup:

- cd into the project directory (the root where this README file is)
- run BE server locally with `bundle exec ruby -run -e httpd . -p 3000`
- run `gem install bundler`
- run `bundle exec pod install` to install all the cocoapods and to set up the xcode project
- launch the app from xcode

## NOTE: if running the server doesn't work
Try:
- follow `rbenv` installation instructions https://github.com/rbenv/rbenv
- after successful rbenv install cd back into the project directory
- try setup steps again

# Tasks:

1. Make the app restore and show the data fetched last time it was launched. After tapping done the app should save received work orders data and then upon subsequent application launches it should display stored work orders prior to done button being tapped.
2. Add loading state for data fetching
3. Add a new Work Order details screen that will be opened by tapping on one of the work orders in the list. It should display work order title and description
4. Refactor the codebase. Feel free to refactor or rewrite the whole thing if you wish and to use any architecture/design pattern and libraries/pods you see fit. There is one caviat though, if you'd like to use SwiftUI (you don't have to btw) you cannot convert this app to a SwiftUI app, fundamentally it should still remain UIKit/ViewController based application. Practically this means that you can use SwiftUI for individual views or screens but routing and navigation for example can't be done with NavigationView.
5. Fix the bugs (what bugs did you find?)
6. Write a description of the changes you made like if you were preparing a pull request with your changes for a code review
7. Optional: Add reasonable amount of unit tests 

## At The Interview

- Be ready to walk interviewers through and discuss the changes you made on the call (what refactorings did you make and why? What design patterns or architecture did you use and why? What else do you think should be added if you had more time?)
- Be ready to pair program on the call by adding more functionality and/or refactoring the code changes you made



# Tasks done
1. Converted the app into MVVM
   a) Renamed MainViewController to OrdersViewController
   b) Created a new controller called OrdersDetailsViewController
   c) Created view models for each controller
   d) View Model has business logic

2. Wrote some testcases
3. Wrote some ui testcases

# Improvements needed

1. Can convert the View Models to combine.
2. Need to handle error cases
3. Nedd to write error test cases

