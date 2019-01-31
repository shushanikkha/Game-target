//
//  ViewController.swift
//  GameTarget
//
//  Created by Shushan Khachatryan on 9/5/18.
//  Copyright © 2018 Shushan Khachatryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblTarget: UILabel!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var score: UITextField!
    @IBOutlet weak var raund: UITextField!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblRaund: UILabel!
    var targetValue = 50
    var sliderValue = 50
    var scoreValue = 0
    var roundValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp()
        self.setUpSlider()
    }

    
    func setUp() {
        self.targetValue = Int(arc4random()%100 + 1)
        self.lblTarget.text = self.targetValue.description
        self.slider.value = 50
        self.lblScore.text = self.scoreValue.description
        self.lblRaund.text = self.roundValue.description
        self.roundValue += 1
    }
    
    
    func setUpSlider() {
        self.slider.setThumbImage(#imageLiteral(resourceName: "imgSliderThumb-Normal"), for: .normal)
        self.slider.setThumbImage(#imageLiteral(resourceName: "imgSliderThumb-Highlighted"), for: .highlighted)
        let insets = UIEdgeInsets(top: 0.0, left: 14.0, bottom: 0.0, right: 14.0)
        let trackLeftImage = #imageLiteral(resourceName: "imgSliderTrackLeft").resizableImage(withCapInsets: insets)
        let trackRightImage = #imageLiteral(resourceName: "imgSliderTrackRight").resizableImage(withCapInsets: insets)
        self.slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        self.slider.setMaximumTrackImage(trackRightImage, for: .normal)
    }

    
    // MARK: - Action
    
    @IBAction func hitMe(_ sender: Any) {
        let difference = abs(self.targetValue - self.sliderValue)
        let point = 100 - difference
        self.scoreValue += point
        let alert = UIAlertController(title: "Points", message: "You earn \(point) points", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.setUp()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func slider(_ sender: UISlider) {
        self.sliderValue = Int(sender.value)
    }


}

