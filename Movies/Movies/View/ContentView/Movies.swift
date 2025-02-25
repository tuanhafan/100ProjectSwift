//
//  Movies.swift
//  Movies
//
//  Created by AlexTran on 23/02/2025.
//

import UIKit

class Movies: UICollectionView {
    
    var movies : [Movie] = dataMovies
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        let layoutMovie = UICollectionViewFlowLayout()
        layoutMovie.minimumInteritemSpacing = 5
        layoutMovie.minimumLineSpacing = 5
        self.register(CustomCellMovie.nib(), forCellWithReuseIdentifier: CustomCellMovie.identifer)
        self.collectionViewLayout = layoutMovie
        self.delegate = self
        self.dataSource = self
    }
    
}


extension Movies : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellMovie.identifer, for: indexPath) as? CustomCellMovie else {
            return UICollectionViewCell()
        }
       
        cell.configure(with: movies[indexPath.row])
        return cell
    }
}
extension Movies : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemPerRow: CGFloat = 3
        let spacing : CGFloat = 2
        let totalSpacing = spacing * (numberOfItemPerRow)
        let collectionViewWidth = collectionView.frame.width
        let itemWidth = (collectionViewWidth - totalSpacing) / numberOfItemPerRow
        return CGSize(width: itemWidth, height: itemWidth + 120)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
