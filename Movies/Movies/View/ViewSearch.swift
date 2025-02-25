//
//  ViewSearch.swift
//  Movies
//
//  Created by AlexTran on 24/02/2025.
//

import UIKit

class ViewSearch: UIView, UISearchBarDelegate {
    
    

    var cancelButton : (() -> Void)?
    let movies : [Movie] = dataMovies
    var moviesSearch : [Movie] = [] {
        didSet {
            self.collectionMovies.reloadData()
        }
    }
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var collectionMovies : UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    
    func setUp() {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.isHidden = true
        collectionMovies?.register(CustomCellMovie.nib(), forCellWithReuseIdentifier: CustomCellMovie.identifer)
        collectionMovies?.collectionViewLayout = layout
        collectionMovies?.backgroundColor = .blue
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            self.isHidden = true
            cancelButton?()
            
        }

     
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            let newMovies = movies.filter{$0.title.lowercased().contains(searchText.lowercased())}
            self.moviesSearch = newMovies
        }
}



extension ViewSearch : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return moviesSearch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellMovie.identifer, for: indexPath) as? CustomCellMovie else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .brown
        cell.configure(with: moviesSearch[indexPath.row])
        return cell
    }
}
extension ViewSearch : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let numberOfItemPerRow: CGFloat = 3
        let spacing : CGFloat = 2
        let totalSpacing = spacing * (numberOfItemPerRow - 1)
        let collectionViewWidth = collectionView.frame.width
        let itemWidth = (collectionViewWidth - totalSpacing) / numberOfItemPerRow
        return CGSize(width: itemWidth, height: itemWidth + 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0
        
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }
            
            layoutAttribute.frame.origin.x = leftMargin
            
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY, maxY)
        }
        
        return attributes
    }
}
