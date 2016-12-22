//
//  ViewController.swift
//  Assignment2
//
//  Created by Son Thai on 11/12/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var openFile: UIButton!
    @IBOutlet weak var archiveFile: UIButton!
    @IBOutlet weak var _medicationsText: UITextField!
    @IBOutlet weak var _alergyText: UITextField!
    @IBOutlet weak var _bloodGroupText: UITextField!
    @IBOutlet weak var _studentIDText: UITextField!
    var _hasData: Bool? = false
    let _dataFile: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        openFile.layer.cornerRadius = 10
        archiveFile.layer.cornerRadius = 10
        _studentIDText.delegate = self
        _bloodGroupText.delegate = self
        _medicationsText.delegate = self
        _alergyText.delegate = self
        /*let filemgr = FileManager.default
        let docsDir = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true)[0]
        let dataFile: String = docsDir + "/test.dat"
    
        if filemgr.fileExists(atPath: dataFile) {
            _hasData = true
        } */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func click(sender: UIButton) {
        if (sender.tag == 0) {
            print("Archive file");
            saveFileToArchive()
        } else if (sender.tag == 1) {
            print("Open file from archive");
            openFileFromArchive(dataFile: _dataFile)
        }
    
    }
    
    func saveFileToArchive() {
        let dataArray: [String] = [self._studentIDText.text!, self._bloodGroupText.text!,
                                   self._alergyText.text!, self._medicationsText.text!]
        let encodeData = NSKeyedArchiver.archivedData(withRootObject: dataArray)
        UserDefaults.standard.setValue(encodeData, forKey: "archiveFile")
        
    }
    
    func openFileFromArchive(dataFile: String!) {
        if let data = UserDefaults.standard.data(forKey: "archiveFile") {
            let dataArray: [String] = NSKeyedUnarchiver.unarchiveObject(with: data) as! [String]
            _studentIDText.text = dataArray[0]
            _bloodGroupText.text = dataArray[1]
            _alergyText.text = dataArray[2]
            _medicationsText.text = dataArray[3]
            
        }
    }
    
    @nonobjc func textFieldDidEndEditing(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


