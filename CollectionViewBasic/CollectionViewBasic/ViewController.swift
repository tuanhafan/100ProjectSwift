//
//  ViewController.swift
//  CollectionViewBasic
//
//  Created by AlexTran on 20/02/2025.
//

import UIKit

let dataLength = 20

class ViewController: UIViewController {

    @IBOutlet weak var collectionViewContent: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        collectionViewContent.collectionViewLayout = layout

        collectionViewContent.register(CustomCell.nib(), forCellWithReuseIdentifier: CustomCell.identifier)
    
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
           if let detailVc = segue.destination as? DetailImage {
                detailVc.nameImage = sender as! String
            }
        }
    }

  
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detail", sender: "\(indexPath.row)")
    }
}


extension ViewController:  UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataLength
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: indexPath.row)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemPerRow: CGFloat = 3
        let spacing : CGFloat = 5
        let totalSpacing = spacing * (numberOfItemPerRow - 1)
        let collectionViewWidth = collectionView.frame.width
        let itemWidth = (collectionViewWidth - totalSpacing) / numberOfItemPerRow
        return CGSize(width: itemWidth, height: itemWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: CGFloat.random(in:0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in:0...1), alpha: 1.0)
    }
}
