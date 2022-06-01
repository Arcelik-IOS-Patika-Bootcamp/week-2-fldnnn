//
//  SecondVC.swift
//  assignment2


import UIKit

class SecondVC: UIViewController {

    weak var delegate: myProtocol?
    var completionHandler: ((String?) -> Void)?
     
    let guessImages = [UIImage(named: "facebook"), UIImage(named: "netflix"), UIImage(named: "patika"), UIImage(named: "android"), UIImage(named: "swift")]
    
    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var firstImageView: UIImageView!
//    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
//        firstImageView.image = UIImage(named: "netflix")
//        secondImageView.image = UIImage(named: "facebook")
         
        collectionView.delegate = self
        collectionView.dataSource = self
         
        collectionView.register(.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionViewCell")
        
        
    }
    
//    @IBAction func firstTapped(_ sender: UITapGestureRecognizer) {
//        delegate?.myDelegateMethod(logoName: "netflix")
//        completionHandler?(textField.text)
//        dismiss(animated: true)
//    }
//
//    @IBAction func secondTapped(_ sender: UITapGestureRecognizer) {
//        delegate?.myDelegateMethod(logoName: "facebook")
//        completionHandler?(textField.text)
//        dismiss(animated: true)
//    }
}
 
extension SecondVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            delegate?.myDelegateMethod(logoName: "facebook")
        } else if indexPath.row == 1 {
            delegate?.myDelegateMethod(logoName: "netflix")
        } else if indexPath.row == 2 {
            delegate?.myDelegateMethod(logoName: "patika")
        } else if indexPath.row == 3 {
            delegate?.myDelegateMethod(logoName: "android")
        } else {
            delegate?.myDelegateMethod(logoName: "swift")
        }
        completionHandler?(textField.text)
        dismiss(animated: true)
    }
}
 
extension SecondVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return guessImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
    
        if indexPath.row % 2 == 0 {
            cell.containerView.backgroundColor = .blue
        } else {
            cell.containerView.backgroundColor = .red
        }
         
        cell.imageView.image = guessImages[indexPath.row]
         
        //This creates the shadows and modifies the cards a little bit
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
        
    }
   
}
 
//extension SecondVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//}

