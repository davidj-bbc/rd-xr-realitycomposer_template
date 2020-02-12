//
//  ViewController.swift
//  BroadcastAR
//
//  Created by David Johnston on 12/02/2020.
//  Copyright © 2020 BBC. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    // init our variables for tracking current NotificationTrigger and count
    var allBehaviours: [BroadcastTest.NotificationTrigger]!
    var behaviourCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load Reality Composer scene named "Scene" from "broadcastTest" Reality Composer project, XCode capitalises it to
        // BroadcastTest
        let broadcastAnchor = try! BroadcastTest.loadScene()
        // add to scen
        arView.scene.anchors.append(broadcastAnchor)
        // stash the list of behaviours for the scene
        allBehaviours = broadcastAnchor.notifications.allNotifications

    }
    
    // override touchesBegan generic method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (behaviourCount < allBehaviours.count ) {
            allBehaviours[behaviourCount].post()
            behaviourCount += 1
        }
        else {
            behaviourCount = 0
        }
      }
}
