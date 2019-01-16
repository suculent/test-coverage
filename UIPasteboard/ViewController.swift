//
//  ViewController.swift
//  UIPasteboard
//
//  Created by This is Terminator on 16/01/2019.
//  Copyright © 2019 Deleted. All rights reserved.
//

import UIKit
import SlackKit

class ViewController: UIViewController {
    
    // WARNING! This is bad practice. Never store credentials in the code!
    let CLIENT_ID = "15022900897.524438636529"
    let CLIENT_SECRET = "a2127114d7a50e7c69117871825e469c"
    let ACCESS_TOKEN = "xoxb-15022900897-524887091476-6nZhBU41C0zhaSYoIMEZfYDm"
    
    var something = false;
    
    var last = ""
    
    let verdicts: [String:Bool] = [
        "Mr. Roboto" : false,
        "Service Kiosks": false,
        "Darth Vader": false,
        "K-9": true,
        "Emotions": false,
        "Self-Driving Cars": false,
        "Telepresence Robots": false,
        "Roomba": true,
        "Assembly-Line Robot": false,
        "ASIMO": false,
        "KITT": false,
        "USS Enterprise": false,
        "Transformers": true,
        "Jaegers": false,
        "The Major": false,
        "Siri": false,
        "The Terminator": true,
        "Commander Data": false,
        "Marvin the Paranoid Android": true,
        "Pinocchio": false,
        "Droids": true,
        "Hitchbot": false,
        "Mars Rovers": false,
        "Space Probes": false,
        "Sasquatch": false,
        "Toaster": false,
        "Toaster Oven": false,
        "Cylons": false,
        "V'ger": true,
        "Ilia Robot": false,
        "The TARDIS": false,
        "Johnny 5": true,
        "Twiki": true,
        "Dr. Theopolis": false,
        "robots.txt": false,
        "Lobot": false,
        "Vicki": true,
        "GlaDOS": false,
        "Turrets": true,
        "Wheatley": true,
        "Herbie the Love Bug": false,
        "Iron Man": false,
        "Ultron": false,
        "The Vision": false,
        "Clockwork Droids": false,
        "Podcasts": false,
        "Cars": false,
        "Swimming Pool Cleaners": false,
        "Burritos": false,
        "Prince Robot IV": false,
        "Daleks": false,
        "Cybermen": false,
        "The Internet of Things": false,
        "Nanobots": true,
        "Two Intermeshed Gears": false,
        "Crow T. Robot": true,
        "Tom Servo": true,
        "Thomas and Friends": false,
        "Replicants": false,
        "Chatbots": false,
        "Agents": false,
        "Lego Simulated Worm Toy": true,
        "Ghosts": false,
        "Exos": true,
        "Rasputin": false,
        "Tamagotchi": false,
        "T-1000": true,
        "The Tin Woodman": false,
        "Mic N. The Robot": true,
        "Robot Or Not Bot": false
    ]
    
    var bot = SlackKit()

    override func viewDidLoad() {
        super.viewDidLoad()
        initSlack()
        
        let notificationName = Notification.Name("applicationDidBecomeActive")
        NotificationCenter.default.addObserver(forName: notificationName, object: nil, queue: OperationQueue.main) { (Notification) in
            print("Sending pasteboard on applicationDidBecomeActive notification...")
            self.sendPasteboard()
        }
        
        NotificationCenter.default.addObserver(forName: UIPasteboard.changedNotification, object: nil, queue: OperationQueue.main) { (Notification) in
            print("Sending pasteboard on change notification...")
            self.sendPasteboard()
        }
    }
    
    deinit {
        let notificationName = Notification.Name("applicationDidBecomeActive")
        NotificationCenter.default.removeObserver(self, name: notificationName, object: nil)
    }
    
    func initSlack() {
        
        bot = SlackKit()
        bot.addRTMBotWithAPIToken(ACCESS_TOKEN)
        bot.addWebAPIAccessWithToken(ACCESS_TOKEN)
        
        //let oauthConfig = OAuthConfig(clientID: CLIENT_ID, clientSecret: CLIENT_SECRET)
        //bot.addServer(oauth: oauthConfig)
        
        bot.notificationForEvent(.message) { [weak self] (event, client) in
            guard
                let message = event.message,
                let id = client?.client?.authenticatedUser?.id,
                message.text?.contains(id) == true
                else {
                    return
            }
            self?.handleMessage(message)
        }
    }
    
    // MARK: Bot logic
    private func handleMessage(_ message: Message) {
        if let text = message.text?.lowercased(), let timestamp = message.ts, let channel = message.channel {
            for (robot, verdict) in verdicts {
                let lowerbot = robot.lowercased()
                if text.contains(lowerbot) {
                    let reaction = verdict ? "robot_face" : "no_entry_sign"
                    bot.webAPI?.addReactionToMessage(name: reaction, channel: channel, timestamp: timestamp, success: nil, failure: nil)
                    return
                }
            }
            // Not found
            bot.webAPI?.addReactionToMessage(name: "question", channel: channel, timestamp: timestamp, success: nil, failure: nil)
            return
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sendPasteboard()
        print("Sending pasteboard on viewDidAppear...")
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
    
    // Used by test only, otherwise deprecated.
    func readPasteboard() {
        
        // Setup, let's put some stuff in the UIPasteboard
        
        let pasteboard = UIPasteboard.general
        pasteboard.string = "#@©|<3∆"
        
        // Understanding the UIPasteboard contents
        
        if pasteboard.hasStrings {
            print("The pasteboard has String: \(pasteboard.string!)")
            sendSlack(string: pasteboard.string!)
        }
        
        pasteboard.url = URL(string: "https://rtm.thinx.cloud")
        
        if pasteboard.hasURLs {
            print("The pasteboard has URLs!")
        }
        
        pasteboard.image = UIImage()
        
        if pasteboard.hasImages {
            print("The pasteboard has images!")
        }
        
        pasteboard.color = UIColor.red
        
        if pasteboard.hasColors {
            print("The pasteboard has colors!")
        }
    }
    
    func sendSlack(string: String) {
        if last != string {
            print("String already sent, deduplicating...")
        } else {
            bot.webAPI?.sendMessage(channel: "#slackit", text: string, success: { (arg0) in
                // code
                print("Slack message sent.")
                self.last = string
            }, failure: { (error: SlackError) in
                print(error.localizedDescription)
                print("Slack message failed.")
            })
        }
    }

    func sendPasteboard() {
        let pasteboard = UIPasteboard.general
        if pasteboard.hasStrings {
            if let aString = pasteboard.string {
                print("The pasteboard has String: \(aString)")
                sendSlack(string: aString)
            }
        } else {
            print("Not found a string to send.")
        }
    }

}

