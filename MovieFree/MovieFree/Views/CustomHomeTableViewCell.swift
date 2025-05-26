//
//  CustomHomeTableViewCell.swift
//  TixAura
//
//  Created by Alex Tran on 14/5/25.
//

import UIKit

class CustomHomeTableViewCell: UITableViewCell {
    
    static let identifier = "CustomHomeTableViewCell"
    private var movies: [Movie] = []
    private var idGenre: Int?
    private var numberToFetch: Int = 15
    private var id: Int?
    var onItemSelected: ((UIImageView, Movie) -> Void)?
    private var currnetPage: Int = 1 {
        didSet {
            numberToFetch = (movies.count * currnetPage) - 5
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 140)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomHomeCollectionViewCell.self, forCellWithReuseIdentifier: CustomHomeCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(collectionView)
        self.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configuration(with idGenre: Int) {
        self.idGenre = idGenre
        self.id = idGenre
        fetchMovies(id: idGenre)
    }
    
    private func fetchMovies(id: Int, page: Int = 1) {
        let apiService = APIService()
        apiService.fetchMoviesOfGenre(withID: id) { result in
            switch result {
            case .success(let arrmovie):
                self.movies += arrmovie
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
    }
}
extension CustomHomeTableViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomHomeCollectionViewCell.identifier, for: indexPath) as? CustomHomeCollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.configure(with: movies[indexPath.row].poster_path!)
        
        return cell
    }
}

extension CustomHomeTableViewCell : UICollectionViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetX = collectionView.contentOffset.x
//        let totalWidthSlider = scrollView.contentSize.width
//        let itemWidth = collectionView.frame.width
//        let currentIndex = Int(round(offsetX / itemWidth))
//        let visiblePercentage = (offsetX - CGFloat(currentIndex) * itemWidth) / itemWidth
//        
//        if(currentIndex >= numberToFetch ) {
//            fetchMovies(id : self.id!, page:(currnetPage + 1))
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CustomHomeCollectionViewCell else { return }

        let movie = movies[indexPath.item]
        onItemSelected?(cell.posterImageView, movie)
        print("\(cell.posterImageView)")
    }
}
