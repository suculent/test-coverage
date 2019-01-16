//
//  UIPasteboardUITests.swift
//  UIPasteboardUITests
//
//  Created by This is Terminator on 16/01/2019.
//  Copyright © 2019 Deleted. All rights reserved.
//

import XCTest

import UIKit



class UIPasteboardUITests: XCTestCase {
    
    var pasteboard = UIPasteboard.general
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        pasteboard = UIPasteboard.general
        pasteboard.string = "#@©|<3∆"
        pasteboard.url = URL(string: "https://rtm.thinx.cloud")
        //pasteboard.image = UIImage()
        //pasteboard.setData(UIImage().pngData()!, forPasteboardType: "png")
        pasteboard.color = UIColor.red
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStrings() {
        if pasteboard.hasStrings {
            print("The pasteboard has Strings!")
        }
    }
    
    func testURLs() {
        if pasteboard.hasURLs {
            print("The pasteboard has URLs!")
        }
    }
    
    func testImages() {
        if pasteboard.hasImages {
            print("The pasteboard has images!")
        }
    }
    
    func testColors() {
        if pasteboard.hasColors {
            print("The pasteboard has colors!")
        }        
    }

}
