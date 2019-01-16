//
//  ViewController.swift
//  UIPasteboard
//
//  Created by This is Terminator on 16/01/2019.
//  Copyright © 2019 Deleted. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var something = false;

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        readPasteboard()
    }

    func untestableExample(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        // Causes example of code uncovered by tests (something will be always false)
        if (something) { return }
        
        // This branch of code will never be tested.
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = "#@©|<3∆"
        pasteboard.url = URL(string: "https://rtm.thinx.cloud")
        pasteboard.image = UIImage()
        pasteboard.color = UIColor.red
        
        if pasteboard.hasStrings {
            print("The pasteboard has Strings!")
        }
        
        if pasteboard.hasURLs {
            print("The pasteboard has URLs!")
        }
        
        if pasteboard.hasImages {
            print("The pasteboard has images!")
        }
        
        if pasteboard.hasColors {
            print("The pasteboard has colors!")
        }
        
        readPasteboard();
    }

    func readPasteboard() {
        
        // Setup, let's put some stuff in the UIPasteboard
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = "#@©|<3∆"
        pasteboard.url = URL(string: "https://rtm.thinx.cloud")
        pasteboard.image = UIImage()
        pasteboard.color = UIColor.red
        
        // Understanding the UIPasteboard contents
        
        if pasteboard.hasStrings {
            print("The pasteboard has Strings!")
        }
        
        if pasteboard.hasURLs {
            print("The pasteboard has URLs!")
        }
        
        if pasteboard.hasImages {
            print("The pasteboard has images!")
        }
        
        if pasteboard.hasColors {
            print("The pasteboard has colors!")
        }
    }

}

