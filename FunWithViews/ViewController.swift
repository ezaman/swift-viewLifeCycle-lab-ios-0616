//
//  ViewController.swift
//  FunWithViews
//
//  Created by James Campagno on 6/1/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UILabel!
    @IBOutlet weak var view9: UILabel!
    @IBOutlet weak var view10: UILabel!
    @IBOutlet weak var view11: UILabel!
    @IBOutlet weak var view12: UILabel!
    @IBOutlet weak var view13: UILabel!
    
    var dieLabels: [UILabel] = []
    var dieViews: [UIView] = []
    var numberOfRolls = 0
    
    @IBAction func dieRoll(sender: UIButton) {
        guard numberOfRolls < 6 else { return }
        
        hideView()
        let randomDieRoll = randomDiceRoll()
        print("die roll: \(randomDieRoll)")
        unhidingViewsAfterRoll(randomDieRoll)
        updateLabelWhenRolling(randomDieRoll)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsAndLabels()
        hideView()
        hideLabels()
    }
    
    func setupViewsAndLabels () {
        dieLabels = [view8, view9, view10, view11, view12, view13]
        dieViews = [view1, view2, view3, view4, view5, view6, view7]
    }
    
    func hideLabels() {
        for label in dieLabels {
            label.hidden = true
        }
    }
    
    func hideView() {
        for view in dieViews {
            view.hidden = true
        }
    }
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }
    
    func updateLabelWhenRolling (number: Int) {
        guard numberOfRolls < 6 else { return }
        let label = dieLabels[numberOfRolls]
        label.text = String(number)
        label.hidden = false
        numberOfRolls += 1
    }
    
    func unhidingViewsAfterRoll(number: Int) {
        var viewsToUnhide: [UIView] = []
        
        switch number {
        case 1: viewsToUnhide = [view7]
        case 2: viewsToUnhide = [view1, view6]
        case 3: viewsToUnhide = [view1, view7, view6]
        case 4: viewsToUnhide = [view1, view3, view4, view6]
        case 5: viewsToUnhide = [view1, view3, view7,view4, view6]
        case 6:viewsToUnhide =  [view1, view2,view3, view4, view5, view6]
        default: assert(number < 6, "Invalid die roll \(number)")
        }
        
        for view in viewsToUnhide {
            view.hidden = false
        }
        
    }
    
    
}
