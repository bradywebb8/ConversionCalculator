//
//  ConversionViewController.swift
//  Conversion Calculator
//
//  Created by Brady Webb on 4/11/19.
//  Copyright © 2019 Brady Webb. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct conversion {
        let label: String
        let inputUnit: String
        let outputUnit: String
        
        init(label: String, inputUnit: String, outputUnit: String) {
            self.label = label
            self.inputUnit = inputUnit
            self.outputUnit = outputUnit
        }
    }
    
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
    
    var inputVal: String = ""
    var outputVal: String = ""
    
    var conversions = [conversion(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
                      conversion(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"),
                      conversion(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
                      conversion(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")]
    var currentConversion: conversion?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        inputVal = ""
        outputVal = ""
        inputDisplay.text = conversions[0].inputUnit
        outputDisplay.text = conversions[0].outputUnit
        currentConversion = conversions[0]
        
    }
    

    @IBAction func converterButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        for conv in conversions {
            alert.addAction(UIAlertAction(title: conv.label, style: UIAlertAction.Style.default, handler: { (alertAction) in
                self.inputDisplay.text = conv.inputUnit
                self.outputDisplay.text = conv.outputUnit
                self.currentConversion = conv
            }))
        }
        
        self.present(alert, animated:true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
 
}

