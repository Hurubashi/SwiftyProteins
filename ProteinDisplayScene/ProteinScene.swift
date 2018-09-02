//
//  ProteinScene.swift
//  ProteinDisplayScene
//
//  Created by Maxym RYBAK on 02.09.2018.
//  Copyright © 2018 Maxym RYBAK. All rights reserved.
//

import UIKit
import SceneKit

class ProteinScene: SCNScene {
    
    init(str: String) {
        super.init()
        let oror = str.split(separator: "\n")
        
        for line in oror {
            let splitedLine = line.split(separator: " ")
            if splitedLine[0] == "ATOM" {
                print(splitedLine[6], splitedLine[7], splitedLine[8])
            }
        }
        let sphereGeometry = SCNSphere(radius: 1)
        sphereGeometry.firstMaterial?.diffuse.contents = UIColor.orange
        let sphereNode = SCNNode(geometry: sphereGeometry)
        self.rootNode.addChildNode(sphereNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
