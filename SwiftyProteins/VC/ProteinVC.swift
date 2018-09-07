//
//  ProteinVC.swift
//  SwiftyProteins
//
//  Created by Ivan OSYPENKO on 9/3/18.
//  Copyright © 2018 iosypenk & mrybak team. All rights reserved.
//

import UIKit
import SceneKit

class ProteinVC: UIViewController {

    @IBOutlet weak var proteinScene: SCNView!
    @IBOutlet weak var atomName: UILabel!
    @IBOutlet weak var atomMass: UILabel!
    @IBOutlet weak var atomBoil: UILabel!
    @IBOutlet weak var atomNumber: UILabel!
    @IBOutlet weak var atomPeriod: UILabel!
    @IBOutlet weak var atomDensity: UILabel!
    @IBOutlet weak var atomDiscovered: UILabel!
    @IBOutlet weak var atomCategory: UILabel!
    @IBOutlet weak var atomSummary:UITextView!
    @IBOutlet weak var atomPhase: UILabel!
    
    
    var pdbfile : String?
    var atoms: Elements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proteinScene.backgroundColor = UIColor.white
        proteinScene.allowsCameraControl = true
        proteinScene.autoenablesDefaultLighting = true
        atomSummary.isEditable = false
        proteinScene.scene = ProteinScene(pdbFile: pdbfile!)
        atomName.text = "Atom name:"
        atoms = GetAtomInfo().getInfo()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: proteinScene)
        let hitList = proteinScene.hitTest(location, options: nil)
        
        if let hitObject = hitList.first {
            if hitObject.node.name != "CONECT" {
            
                for element in (atoms?.elements)! {
                    if (element.symbol?.lowercased() == hitObject.node.name?.lowercased()) {
                        initAtomLabels(element: element)
                    }
                }
            } else {
                atomName.text = atomName.text
            }
        }
    }
    
    func initAtomLabels (element: AtomInfo) {
        atomName.text = element.name! + " (" + element.symbol! + ")"
        atomMass.text = "Atomic mass: " + (element.atomic_mass == nil ? "no info" : String(describing: element.atomic_mass!))
        atomBoil.text = "Boil temp: " + (element.boil == nil ? "no info" : String(describing: element.boil!))
        atomNumber.text = "Number: " + (element.number == nil ? "no info" : String(describing: element.number!))
        atomPeriod.text = "Period: " + (element.period == nil ? "no info" : String(describing: element.period!))
        atomDensity.text = "Density: " + (element.density == nil ? "no info" : String(describing: element.density!))
        atomPhase.text = "Phase: " + element.phase!
        atomDiscovered.text = "Discovered by: \n" + element.discovered_by!
        atomCategory.text = "Category: \n" + element.category!
        atomSummary.text = element.summary
    }
}
