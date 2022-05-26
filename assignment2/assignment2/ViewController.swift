//
//  ViewController.swift
//  assignment2


import UIKit
 
protocol myProtocol {
    func myDelegateMethod(mealName: String)
}
 
class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goSegue" {
            let vc = segue.destination as! SecondVC
            vc.delegate = self
        }
    }
}
 
extension ViewController: myProtocol {
    func myDelegateMethod(mealName: String) {
        myImageView.image = UIImage(named: mealName)
    }
}
 

 
class SecondVC: UIViewController {

    var delegate: myProtocol?
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        firstImageView.image = UIImage(named: "hmbgr")
        secondImageView.image = UIImage(named: "pizza")
        
        
    }
    
    @IBAction func firstTapped(_ sender: UITapGestureRecognizer) {
        delegate?.myDelegateMethod(mealName: "hmbgr")
        dismiss(animated: true)
    }
    
    @IBAction func secondTapped(_ sender: UITapGestureRecognizer) {
        delegate?.myDelegateMethod(mealName: "pizza")
        dismiss(animated: true)
    }
}
