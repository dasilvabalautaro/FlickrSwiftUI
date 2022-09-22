# iOS-Interview-Challenge

## About this project
A simple iOS app to integrate with the Flickr API to display a list of photos corresponding to a user's search input.

### Project development

The project use SwiftUI and Resolver(library DI), this is only 3rd party library. The cycle was Inversion of Control -> Dependency Injection -> Dependency Inversion -> Loosely Coupled Class. 

The flow PhotoListView -> Photos -> CapturePhotoService -> NetworkService -> URLComponentsService -> URLSession.


### Project setup
Xcode Editor 12.4, IOS 14.4, Swift 5, Resolver 1.5.0

