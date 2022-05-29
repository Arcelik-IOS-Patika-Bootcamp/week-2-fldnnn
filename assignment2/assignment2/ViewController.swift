//
//  ViewController.swift
//  assignment2


import UIKit
 
protocol myProtocol {
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
            vc.completionHandler = { text in if text == "netflix", self.logoName == "netflix" {
                self.myLabelView.text = text
            } else if text == "facebook", self.logoName == "facebook" {
                self.myLabelView.text = text
            } else {
                self.myLabelView.text = "Wrong!"
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
 

 
class SecondVC: UIViewController {

    var delegate: myProtocol?
    var completionHandler: ((String?) -> Void)?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = UIImage(named: "netflix")
        secondImageView.image = UIImage(named: "facebook")
        
        
    }
    
    @IBAction func firstTapped(_ sender: UITapGestureRecognizer) {
        delegate?.myDelegateMethod(logoName: "netflix")
        completionHandler?(textField.text)
        dismiss(animated: true)
    }
    
    @IBAction func secondTapped(_ sender: UITapGestureRecognizer) {
        delegate?.myDelegateMethod(logoName: "facebook")
        completionHandler?(textField.text)
        dismiss(animated: true)
    }
}
