//
//  ViewController.swift
//  assignment2


import UIKit
 
protocol myProtocol: AnyObject {
    func myDelegateMethod(logoName: String)
}
 
class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabelView: UILabel!
     
    private var logoName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSegue" {
            let vc = segue.destination as! SecondVC
            vc.delegate = self
            vc.completionHandler = { [weak self] text in if text == "netflix", self?.logoName == "netflix" {
                self?.myLabelView.text = text
            } else if text == "facebook", self?.logoName == "facebook" {
                self?.myLabelView.text = text
            } else if text == "patika", self?.logoName == "patika" {
                    self?.myLabelView.text = text
            } else if text == "swift", self?.logoName == "swift" {
                self?.myLabelView.text = text
            } else if text == "android", self?.logoName == "android" {
                self?.myLabelView.text = text
            } else {
                self?.myLabelView.text = "Wrong!"
            }
            return
            }
        }
    }
}
 
extension ViewController: myProtocol {
    func myDelegateMethod(logoName: String) {
        myImageView.image = UIImage(named: logoName)
        self.logoName = logoName
    }
}
 

 

