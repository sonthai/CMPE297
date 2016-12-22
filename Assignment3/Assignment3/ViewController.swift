//
//  ViewController.swift
//  Assignment3
//
//  Created by Son Thai on 11/14/16.
//  Copyright © 2016 Son Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var fileStoreBtn: UIButton!
    @IBOutlet weak var archiveBtn: UIButton!
    @IBOutlet weak var restoreFileStorage: UIButton!
    @IBOutlet weak var restoreArchive: UIButton!
    @IBOutlet weak var _bookName: UITextField!
    @IBOutlet weak var _authorName: UITextField!
    @IBOutlet weak var _description: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fileStoreBtn.titleLabel?.textAlignment = NSTextAlignment.center
        archiveBtn.titleLabel?.textAlignment = NSTextAlignment.center
        restoreArchive.titleLabel?.textAlignment = NSTextAlignment.center
        restoreFileStorage.titleLabel?.textAlignment = NSTextAlignment.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fileManagerEvent(sender: UIButton) {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let url = NSURL(fileURLWithPath: path)
        let filePath = url.appendingPathComponent("bookInfo")?.path
        let fileManager = FileManager.default
 
        if (sender.tag == 0) {
            print("Save with file storage")
            let dataString = self._bookName.text! + "," + self._authorName.text! + "," + self._description.text!
            let data = dataString.data(using: .utf8)
            fileManager.createFile(atPath: filePath!, contents: data, attributes: nil)
        } else if (sender.tag == 1) {
            if fileManager.fileExists(atPath: filePath!) {
                print("Restore with file storage")
                let buffer: Data? = fileManager.contents(atPath: filePath!)
                let dataStr = String(data: buffer!, encoding: .utf8)
                let dataArray: [String] =  (dataStr?.components(separatedBy: ","))!
                _bookName.text = dataArray[0]
                _authorName.text = dataArray[1]
                _description.text = dataArray[2]
            }
        }
    }
    
    @IBAction func archiveEvent(sender: UIButton) {
        if (sender.tag == 3) {
            print("Save with archiver")
            saveDataToArchive()
        } else if (sender.tag == 4) {
            print("Restore with archiver")
            restoreDataFromArchive()
        }
        
    }
    
    func saveDataToArchive() {
        let dataArray: [String] = [self._bookName.text!, self._authorName.text!, self._description.text!]
        let encodeData = NSKeyedArchiver.archivedData(withRootObject: dataArray)
        UserDefaults.standard.set(encodeData, forKey: "archiveFile")
    }
    
    func restoreDataFromArchive() {
        let data = UserDefaults.standard.data(forKey: "archiveFile")
        if (data != nil) {
            let dataArray: [String] = NSKeyedUnarchiver.unarchiveObject(with: data!) as! [String]
            _bookName.text = dataArray[0]
            _authorName.text = dataArray[1]
            _description.text = dataArray[2]
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

