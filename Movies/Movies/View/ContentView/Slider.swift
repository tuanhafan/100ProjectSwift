//
//  Slider.swift
//  Movies
//
//  Created by AlexTran on 23/02/2025.
//

import UIKit

class Slider: UICollectionView {

    var infiniteSlider : [String] = [sliders.last!] + sliders + [sliders.first!]
    private var isFirstLoad = true
      
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
                if self.isFirstLoad, self.infiniteSlider.count > 1 {
                    self.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
                    self.isFirstLoad = false
                }
            }
    }
    
    func setUp() {
        let layoutSlider = UICollectionViewFlowLayout()
        layoutSlider.scrollDirection = .horizontal
        self.register(CustomCellSlider.nib(), forCellWithReuseIdentifier: CustomCellSlider.identifer)
        self.collectionViewLayout = layoutSlider
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        self.dataSource = self
    }

}
extension Slider : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = self.contentOffset.x
        let totalWidthSlider = scrollView.contentSize.width
        let itemWidth = self.frame.width
        let currentIndex = Int(round(offsetX / itemWidth))
        let visiblePercentage = (offsetX - CGFloat(currentIndex) * itemWidth) / itemWidth
        
        if(currentIndex == 0 && visiblePercentage == 0.0 ) {
            self.contentOffset = CGPoint(x: totalWidthSlider - (2 * itemWidth), y: 0)
        }
        if(currentIndex == 6 && visiblePercentage == 0.0 ) {
            self.contentOffset = CGPoint(x: itemWidth, y: 0)
        }
    }
}

extension Slider : UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infiniteSlider.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCellSlider.identifer, for: indexPath) as? CustomCellSlider else {
            return UICollectionViewCell()
        }
        cell.configure(with: infiniteSlider[indexPath.row])
        return cell
    }
    
}

extension Slider : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
