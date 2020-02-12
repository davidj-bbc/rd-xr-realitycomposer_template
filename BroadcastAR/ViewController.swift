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
    
    var allBehaviours: [BroadcastTest.NotificationTrigger]!
    var behaviourCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let broadcastAnchor = try! BroadcastTest.loadScene()
        arView.scene.anchors.append(broadcastAnchor)
        
        allBehaviours = broadcastAnchor.notifications.allNotifications

    }
    
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
