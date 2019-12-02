//
//  PopUpViewController.swift
//  iPokerChips
//
//  Created by Billy Habimana Cyusa on 12/2/19.
//  Copyright © 2019 Nicholas Deily. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var choices:[String] = []
    var picker: UIPickerView = UIPickerView()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return choices[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(choices[row])
        
    }
    
    
    
    
    func createPickerView() {
        
        picker = UIPickerView(frame: CGRect(x:0, y: 225, width: 414, height: 300)) 
        picker.numberOfRows(inComponent: choices.count)
        picker.layer.cornerRadius = 20
        picker.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
        
        
        self.view.addSubview(picker)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Who won this round?"
        self.view.backgroundColor = UIColor.white
        createPickerView()
        self.picker.dataSource = self
        self.picker.delegate = self
        self.navigationController?.navigationBar.isHidden = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Win pot", style: .plain, target: self, action: #selector(addTapped))
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "green background")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        // Do any additional setup after loading the view.
    }
    
    @objc func addTapped() {
        
        print(choices[picker.selectedRow(inComponent: 0)])
        
        
        
        let stack = self.navigationController?.viewControllers
        if (stack!.count > 1) {
            let gameController = stack![stack!.count-2] as! GameViewController
            gameController.giveChipsFromPot(to: picker.selectedRow(inComponent: 0))
            navigationController?.popViewController(animated: false)
            
            dismiss(animated: false , completion: nil)        }
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
