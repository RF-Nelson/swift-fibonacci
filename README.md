<div align="center"><h2>Smooth-scrolling Fibonacci Tableview in Swift</h2><br><img src="http://i.imgur.com/ZJfsZvG.gif"/><br><br>[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?style=flat)](http://www.apple.com/ios/)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)<br><br></div><h4>

### Info
The goal of this project is to create a `UITableView` that displays the highest possible number in the fibonacci sequence while also retaining smooth scrolling. 

In addition to standard [TableViewCell dequeueing](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITableView_Class/#//apple_ref/occ/instm/UITableView/dequeueReusableCellWithIdentifier:), This project uses the [memoization](https://en.wikipedia.org/wiki/Memoization) technique to cache recursive calls in the fibonacci function, as explained in Apple's [2014 WWDC "Advaced Swift" talk](https://developer.apple.com/videos/play/wwdc2014/404/).

This project was created in Xcode 7.3.1. You should be able to download and build this project on any iOS device. It was tested on an iPhone 6 Plus and a second-generation iPad Mini.
