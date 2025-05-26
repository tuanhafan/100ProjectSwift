//
//  DetailMovieViewController.swift
//  TixAura
//
//  Created by Alex Tran on 14/5/25.
//

import UIKit

class DetailMovieViewController: UIViewController,ZoomingViewController {
    
    

    var movieID: Int!
    var movie: MovieDetail?
    var imageView : UIImageView!
    
    // MARK: - UI Elements
      let scrollView = UIScrollView()
      let contentView = UIView()
      
      // Fixed Video thumbnail container (outside scroll view)
      let videoContainer = UIView()
      let videoImageView = UIImageView()
      let playButton = UIButton(type: .system)
      let castButton = UIButton(type: .system)
      let closeButton = UIButton(type: .system)
      let muteButton = UIButton(type: .system)
      
      // Scrollable content
      let titleLabel = UILabel()
      let infoStack = UIStackView()
      let yearLabel = UILabel()
      let ageLabel = UILabel()
      let episodesLabel = UILabel()
      let hdLabel = UILabel()
      
      // Buttons
      let playMainButton = UIButton(type: .system)
      let downloadButton = UIButton(type: .system)
      
      // Description
      let descriptionLabel = UILabel()
      let actorsLabel = UILabel()
      let authorsLabel = UILabel()
      
      // Icon menu
      let iconMenuStack = UIStackView()
      
      // Tabs
      let tabsStack = UIStackView()
      let tabEpisodesButton = UIButton(type: .system)
      let tabSimilarButton = UIButton(type: .system)
      
      // Episodes list container
      let episodesContainer = UIView()
      
      // Episode 1
      let episode1Container = UIView()
      let episode1ImageView = UIImageView()
      let episode1PlayButton = UIButton(type: .system)
      let episode1TitleLabel = UILabel()
      let episode1DurationLabel = UILabel()
      let episode1DownloadButton = UIButton(type: .system)
      let episode1DescriptionLabel = UILabel()
      
      // Episode 2
      let episode2Container = UIView()
      let episode2ImageView = UIImageView()
      let episode2PlayButton = UIButton(type: .system)
      let episode2TitleLabel = UILabel()
      let episode2DurationLabel = UILabel()
      let episode2DownloadButton = UIButton(type: .system)
      let episode2DescriptionLabel = UILabel()
      
      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .black
          setupVideoSection() // Fixed video section
          setupScrollView()   // Scrollable content
          setupTitleInfo()
          setupButtons()
          setupDescription()
          setupIconMenu()
          setupTabs()
          setupEpisodes()
          
                  let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSelf))
                  view.addGestureRecognizer(tapGesture)
      }
      
      func setupVideoSection() {
          videoContainer.translatesAutoresizingMaskIntoConstraints = false
          videoImageView.translatesAutoresizingMaskIntoConstraints = false
          playButton.translatesAutoresizingMaskIntoConstraints = false
          castButton.translatesAutoresizingMaskIntoConstraints = false
          closeButton.translatesAutoresizingMaskIntoConstraints = false
          muteButton.translatesAutoresizingMaskIntoConstraints = false
          
          view.addSubview(videoContainer)
          videoContainer.addSubview(videoImageView)
          videoContainer.addSubview(playButton)
          videoContainer.addSubview(castButton)
          videoContainer.addSubview(closeButton)
          videoContainer.addSubview(muteButton)
          
          // Video image
          videoImageView.contentMode = .scaleAspectFill
          videoImageView.clipsToBounds = true
          videoImageView.layer.cornerRadius = 10
          videoImageView.image = UIImage(named: "video_thumbnail") ?? UIImage(systemName: "car.fill")
          
          // Play button center
          playButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
          playButton.tintColor = .white
          playButton.backgroundColor = UIColor(white: 0, alpha: 0.5)
          playButton.layer.cornerRadius = 28
          playButton.clipsToBounds = true
          
          // Cast button top right
          castButton.setImage(UIImage(systemName: "dot.radiowaves.left.and.right"), for: .normal)
          castButton.tintColor = .white
          
          // Close button top right
          closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
          closeButton.tintColor = .white
          
          // Mute button bottom right
          muteButton.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
          muteButton.tintColor = .white.withAlphaComponent(0.7)
          
          NSLayoutConstraint.activate([
              videoContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
              videoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
              videoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
              videoContainer.heightAnchor.constraint(equalTo: videoContainer.widthAnchor, multiplier: 9/16),
              
              videoImageView.topAnchor.constraint(equalTo: videoContainer.topAnchor),
              videoImageView.leadingAnchor.constraint(equalTo: videoContainer.leadingAnchor),
              videoImageView.trailingAnchor.constraint(equalTo: videoContainer.trailingAnchor),
              videoImageView.bottomAnchor.constraint(equalTo: videoContainer.bottomAnchor),
              
              playButton.centerXAnchor.constraint(equalTo: videoContainer.centerXAnchor),
              playButton.centerYAnchor.constraint(equalTo: videoContainer.centerYAnchor),
              playButton.widthAnchor.constraint(equalToConstant: 56),
              playButton.heightAnchor.constraint(equalToConstant: 56),
              
              closeButton.topAnchor.constraint(equalTo: videoContainer.topAnchor, constant: 8),
              closeButton.trailingAnchor.constraint(equalTo: videoContainer.trailingAnchor, constant: -8),
              closeButton.widthAnchor.constraint(equalToConstant: 28),
              closeButton.heightAnchor.constraint(equalToConstant: 28),
              
              castButton.topAnchor.constraint(equalTo: videoContainer.topAnchor, constant: 8),
              castButton.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -12),
              castButton.widthAnchor.constraint(equalToConstant: 28),
              castButton.heightAnchor.constraint(equalToConstant: 28),
              
              muteButton.bottomAnchor.constraint(equalTo: videoContainer.bottomAnchor, constant: -8),
              muteButton.trailingAnchor.constraint(equalTo: videoContainer.trailingAnchor, constant: -8),
              muteButton.widthAnchor.constraint(equalToConstant: 24),
              muteButton.heightAnchor.constraint(equalToConstant: 24),
          ])
      }
      
      func setupScrollView() {
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          contentView.translatesAutoresizingMaskIntoConstraints = false
          
          view.addSubview(scrollView)
          scrollView.addSubview(contentView)
          
          NSLayoutConstraint.activate([
              scrollView.topAnchor.constraint(equalTo: videoContainer.bottomAnchor, constant: 8),
              scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
              
              contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
              contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
              contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
              contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
              contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
          ])
      }
      
      func setupTitleInfo() {
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          infoStack.translatesAutoresizingMaskIntoConstraints = false
          yearLabel.translatesAutoresizingMaskIntoConstraints = false
          ageLabel.translatesAutoresizingMaskIntoConstraints = false
          episodesLabel.translatesAutoresizingMaskIntoConstraints = false
          hdLabel.translatesAutoresizingMaskIntoConstraints = false
          
          contentView.addSubview(titleLabel)
          contentView.addSubview(infoStack)
          
          titleLabel.text = "Tài xế ẩn danh"
          titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
          titleLabel.textColor = .white
          
          yearLabel.text = "2021"
          yearLabel.font = UIFont.systemFont(ofSize: 14)
          yearLabel.textColor = UIColor(white: 0.8, alpha: 1)
          
          ageLabel.text = "T18"
          ageLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
          ageLabel.textColor = .white
          ageLabel.textAlignment = .center
          ageLabel.layer.borderColor = UIColor.gray.cgColor
          ageLabel.layer.borderWidth = 1
          ageLabel.layer.cornerRadius = 4
          ageLabel.clipsToBounds = true
          ageLabel.setContentHuggingPriority(.required, for: .horizontal)
          ageLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
          ageLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
          
          episodesLabel.text = "16 tập"
          episodesLabel.font = UIFont.systemFont(ofSize: 14)
          episodesLabel.textColor = UIColor(white: 0.8, alpha: 1)
          
          hdLabel.text = "HD"
          hdLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
          hdLabel.textColor = .white
          hdLabel.textAlignment = .center
          hdLabel.layer.borderColor = UIColor.gray.cgColor
          hdLabel.layer.borderWidth = 1
          hdLabel.layer.cornerRadius = 4
          hdLabel.clipsToBounds = true
          hdLabel.setContentHuggingPriority(.required, for: .horizontal)
          hdLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
          hdLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
          
          infoStack.axis = .horizontal
          infoStack.spacing = 8
          infoStack.alignment = .center
          infoStack.addArrangedSubview(yearLabel)
          infoStack.addArrangedSubview(ageLabel)
          infoStack.addArrangedSubview(episodesLabel)
          infoStack.addArrangedSubview(hdLabel)
          
          NSLayoutConstraint.activate([
              titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
              titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
              titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              
              infoStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
              infoStack.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
              infoStack.heightAnchor.constraint(equalToConstant: 20)
          ])
      }
      
      func setupButtons() {
          playMainButton.translatesAutoresizingMaskIntoConstraints = false
          downloadButton.translatesAutoresizingMaskIntoConstraints = false
          
          contentView.addSubview(playMainButton)
          contentView.addSubview(downloadButton)
          
          playMainButton.setTitle("▶ Phát", for: .normal)
          playMainButton.setTitleColor(.black, for: .normal)
          playMainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          playMainButton.backgroundColor = UIColor(white: 0.85, alpha: 1)
          playMainButton.layer.cornerRadius = 6
          
          downloadButton.setTitle("⬇ Tải xuống", for: .normal)
          downloadButton.setTitleColor(UIColor(white: 0.8, alpha: 1), for: .normal)
          downloadButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
          downloadButton.backgroundColor = UIColor(white: 0.15, alpha: 1)
          downloadButton.layer.cornerRadius = 6
          
          NSLayoutConstraint.activate([
              playMainButton.topAnchor.constraint(equalTo: infoStack.bottomAnchor, constant: 12),
              playMainButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
              playMainButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              playMainButton.heightAnchor.constraint(equalToConstant: 44),
              
              downloadButton.topAnchor.constraint(equalTo: playMainButton.bottomAnchor, constant: 8),
              downloadButton.leadingAnchor.constraint(equalTo: playMainButton.leadingAnchor),
              downloadButton.trailingAnchor.constraint(equalTo: playMainButton.trailingAnchor),
              downloadButton.heightAnchor.constraint(equalToConstant: 44),
          ])
      }
      
      func setupDescription() {
          descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
          actorsLabel.translatesAutoresizingMaskIntoConstraints = false
          authorsLabel.translatesAutoresizingMaskIntoConstraints = false
          
          contentView.addSubview(descriptionLabel)
          contentView.addSubview(actorsLabel)
          contentView.addSubview(authorsLabel)
          
          descriptionLabel.text = "Vị cựu lính đặc nhiệm trả thù cho những nạn nhân của sự bất công khi làm việc cho một tổ chức bí mật ẩn sau danh nghĩa một công ty taxi."
          descriptionLabel.font = UIFont.systemFont(ofSize: 14)
          descriptionLabel.textColor = UIColor(white: 0.8, alpha: 1)
          descriptionLabel.numberOfLines = 0
          
          actorsLabel.text = "Diễn viên: Lee Je Hoon, Esom, Kim Eui Sung … xem thêm"
          actorsLabel.font = UIFont.systemFont(ofSize: 12)
          actorsLabel.textColor = UIColor(white: 0.5, alpha: 1)
          actorsLabel.numberOfLines = 1
          
          authorsLabel.text = "Tác giả: Park Jun Wu, Oh Sang Ho, Lee Ji Hyeon"
          authorsLabel.font = UIFont.systemFont(ofSize: 12)
          authorsLabel.textColor = UIColor(white: 0.5, alpha: 1)
          authorsLabel.numberOfLines = 1
          
          NSLayoutConstraint.activate([
              descriptionLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 12),
              descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
              descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              
              actorsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
              actorsLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
              actorsLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
              
              authorsLabel.topAnchor.constraint(equalTo: actorsLabel.bottomAnchor, constant: 2),
              authorsLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
              authorsLabel.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
          ])
      }
      
      func createIconMenuButton(iconName: String, title: String) -> UIStackView {
          let icon = UIImageView(image: UIImage(systemName: iconName))
          icon.tintColor = .white
          icon.contentMode = .scaleAspectFit
          icon.translatesAutoresizingMaskIntoConstraints = false
          icon.widthAnchor.constraint(equalToConstant: 24).isActive = true
          icon.heightAnchor.constraint(equalToConstant: 24).isActive = true
          
          let label = UILabel()
          label.text = title
          label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
          label.textColor = .white
          label.textAlignment = .center
          
          let stack = UIStackView(arrangedSubviews: [icon, label])
          stack.axis = .vertical
          stack.alignment = .center
          stack.spacing = 4
          stack.translatesAutoresizingMaskIntoConstraints = false
          return stack
      }
      
      func setupIconMenu() {
          iconMenuStack.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview(iconMenuStack)
          
          iconMenuStack.axis = .horizontal
          iconMenuStack.distribution = .equalSpacing
          iconMenuStack.alignment = .center
          
          let danhSach = createIconMenuButton(iconName: "plus", title: "Danh sách của tôi")
          let xepHang = createIconMenuButton(iconName: "hand.thumbsup.fill", title: "Xếp hạng")
          let chiaSe = createIconMenuButton(iconName: "paperplane.fill", title: "Chia sẻ")
          let taiXuong = createIconMenuButton(iconName: "arrow.down.to.line.alt", title: "Tải xuống\n16 tập")
          
          iconMenuStack.addArrangedSubview(danhSach)
          iconMenuStack.addArrangedSubview(xepHang)
          iconMenuStack.addArrangedSubview(chiaSe)
          iconMenuStack.addArrangedSubview(taiXuong)
          
          // Add red underline for "Danh sách của tôi"
          let underline = UIView()
          underline.backgroundColor = UIColor.red
          underline.translatesAutoresizingMaskIntoConstraints = false
          danhSach.addSubview(underline)
          
          NSLayoutConstraint.activate([
              underline.heightAnchor.constraint(equalToConstant: 2),
              underline.widthAnchor.constraint(equalToConstant: 40),
              underline.bottomAnchor.constraint(equalTo: danhSach.bottomAnchor),
              underline.centerXAnchor.constraint(equalTo: danhSach.centerXAnchor)
          ])
          
          NSLayoutConstraint.activate([
              iconMenuStack.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 20),
              iconMenuStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
              iconMenuStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              iconMenuStack.heightAnchor.constraint(equalToConstant: 60)
          ])
      }
      
      func setupTabs() {
          tabsStack.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview(tabsStack)
          
          tabsStack.axis = .horizontal
          tabsStack.spacing = 24
          
          tabEpisodesButton.setTitle("Các tập", for: .normal)
          tabEpisodesButton.setTitleColor(.white, for: .normal)
          tabEpisodesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          tabEpisodesButton.layer.borderColor = UIColor.red.cgColor
          tabEpisodesButton.layer.borderWidth = 0
          tabEpisodesButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
          tabEpisodesButton.layer.addSublayer({
              let line = CALayer()
              line.backgroundColor = UIColor.red.cgColor
              line.frame = CGRect(x: 0, y: 38, width: 50, height: 2)
              return line
          }())
          
          tabSimilarButton.setTitle("Nội dung tương tự", for: .normal)
          tabSimilarButton.setTitleColor(UIColor.gray, for: .normal)
          tabSimilarButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
          
          tabsStack.addArrangedSubview(tabEpisodesButton)
          tabsStack.addArrangedSubview(tabSimilarButton)
          
          NSLayoutConstraint.activate([
              tabsStack.topAnchor.constraint(equalTo: iconMenuStack.bottomAnchor, constant: 12),
              tabsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
          ])
      }
      
      func setupEpisodes() {
          episodesContainer.translatesAutoresizingMaskIntoConstraints = false
          contentView.addSubview(episodesContainer)
          
          // Title "Tài xế ẩn danh"
          let episodesTitleLabel = UILabel()
          episodesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
          episodesTitleLabel.text = "Tài xế ẩn danh"
          episodesTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
          episodesTitleLabel.textColor = .white
          episodesContainer.addSubview(episodesTitleLabel)
          
          // Episode 1
          episode1Container.translatesAutoresizingMaskIntoConstraints = false
          episodesContainer.addSubview(episode1Container)
          
          episode1ImageView.translatesAutoresizingMaskIntoConstraints = false
          episode1ImageView.contentMode = .scaleAspectFill
          episode1ImageView.clipsToBounds = true
          episode1ImageView.layer.cornerRadius = 6
          episode1ImageView.image = UIImage(named: "episode1") ?? UIImage(systemName: "play.rectangle.fill")
          episode1Container.addSubview(episode1ImageView)
          
          episode1PlayButton.translatesAutoresizingMaskIntoConstraints = false
          episode1PlayButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
          episode1PlayButton.tintColor = .white
          episode1PlayButton.backgroundColor = UIColor(white: 0, alpha: 0.5)
          episode1PlayButton.layer.cornerRadius = 20
          episode1PlayButton.clipsToBounds = true
          episode1Container.addSubview(episode1PlayButton)
          
          episode1TitleLabel.translatesAutoresizingMaskIntoConstraints = false
          episode1TitleLabel.text = "1. Tập 1"
          episode1TitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
          episode1TitleLabel.textColor = .white
          episode1Container.addSubview(episode1TitleLabel)
          
          episode1DurationLabel.translatesAutoresizingMaskIntoConstraints = false
          episode1DurationLabel.text = "1g 6p"
          episode1DurationLabel.font = UIFont.systemFont(ofSize: 12)
          episode1DurationLabel.textColor = UIColor.gray
          episode1Container.addSubview(episode1DurationLabel)
          
          episode1DownloadButton.translatesAutoresizingMaskIntoConstraints = false
          episode1DownloadButton.setImage(UIImage(systemName: "arrow.down.to.line.alt"), for: .normal)
          episode1DownloadButton.tintColor = UIColor.gray
          episode1Container.addSubview(episode1DownloadButton)
          
          episode1DescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
          episode1DescriptionLabel.text = "Bị lạm dụng đến hoảng loạn, một cô gái thiếu năng trí tuệ nhờ đến dịch vụ của Kim Do Ki và biệt đội báo thù của anh."
          episode1DescriptionLabel.font = UIFont.systemFont(ofSize: 13)
          episode1DescriptionLabel.textColor = UIColor(white: 0.8, alpha: 1)
          episode1DescriptionLabel.numberOfLines = 0
          episode1Container.addSubview(episode1DescriptionLabel)
          
          // Episode 2
          episode2Container.translatesAutoresizingMaskIntoConstraints = false
          episodesContainer.addSubview(episode2Container)
          
          episode2ImageView.translatesAutoresizingMaskIntoConstraints = false
          episode2ImageView.contentMode = .scaleAspectFill
          episode2ImageView.clipsToBounds = true
          episode2ImageView.layer.cornerRadius = 6
          episode2ImageView.image = UIImage(named: "episode2") ?? UIImage(systemName: "play.rectangle.fill")
          episode2Container.addSubview(episode2ImageView)
          
          episode2PlayButton.translatesAutoresizingMaskIntoConstraints = false
          episode2PlayButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
          episode2PlayButton.tintColor = .white
          episode2PlayButton.backgroundColor = UIColor(white: 0, alpha: 0.5)
          episode2PlayButton.layer.cornerRadius = 20
          episode2PlayButton.clipsToBounds = true
          episode2Container.addSubview(episode2PlayButton)
          
          episode2TitleLabel.translatesAutoresizingMaskIntoConstraints = false
          episode2TitleLabel.text = "2. Tập 2"
          episode2TitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
          episode2TitleLabel.textColor = .white
          episode2Container.addSubview(episode2TitleLabel)
          
          episode2DurationLabel.translatesAutoresizingMaskIntoConstraints = false
          episode2DurationLabel.text = "1g 6p"
          episode2DurationLabel.font = UIFont.systemFont(ofSize: 12)
          episode2DurationLabel.textColor = UIColor.gray
          episode2Container.addSubview(episode2DurationLabel)
          
          episode2DownloadButton.translatesAutoresizingMaskIntoConstraints = false
          episode2DownloadButton.setImage(UIImage(systemName: "arrow.down.to.line.alt"), for: .normal)
          episode2DownloadButton.tintColor = UIColor.gray
          episode2Container.addSubview(episode2DownloadButton)
          
          episode2DescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
          episode2DescriptionLabel.text = ""
          episode2DescriptionLabel.font = UIFont.systemFont(ofSize: 13)
          episode2DescriptionLabel.textColor = UIColor(white: 0.8, alpha: 1)
          episode2DescriptionLabel.numberOfLines = 0
          episode2Container.addSubview(episode2DescriptionLabel)
          
          // Layout constraints
          NSLayoutConstraint.activate([
              episodesContainer.topAnchor.constraint(equalTo: tabsStack.bottomAnchor, constant: 12),
              episodesContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
              episodesContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
              episodesContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
              
              episodesTitleLabel.topAnchor.constraint(equalTo: episodesContainer.topAnchor),
              episodesTitleLabel.leadingAnchor.constraint(equalTo: episodesContainer.leadingAnchor),
              episodesTitleLabel.trailingAnchor.constraint(equalTo: episodesContainer.trailingAnchor),
              
              // Episode 1 container
              episode1Container.topAnchor.constraint(equalTo: episodesTitleLabel.bottomAnchor, constant: 12),
              episode1Container.leadingAnchor.constraint(equalTo: episodesContainer.leadingAnchor),
              episode1Container.trailingAnchor.constraint(equalTo: episodesContainer.trailingAnchor),
              
              episode1ImageView.leadingAnchor.constraint(equalTo: episode1Container.leadingAnchor),
              episode1ImageView.topAnchor.constraint(equalTo: episode1Container.topAnchor),
              episode1ImageView.widthAnchor.constraint(equalToConstant: 96),
              episode1ImageView.heightAnchor.constraint(equalToConstant: 56),
              
              episode1PlayButton.centerXAnchor.constraint(equalTo: episode1ImageView.centerXAnchor),
              episode1PlayButton.centerYAnchor.constraint(equalTo: episode1ImageView.centerYAnchor),
              episode1PlayButton.widthAnchor.constraint(equalToConstant: 40),
              episode1PlayButton.heightAnchor.constraint(equalToConstant: 40),
              
              episode1TitleLabel.topAnchor.constraint(equalTo: episode1Container.topAnchor),
              episode1TitleLabel.leadingAnchor.constraint(equalTo: episode1ImageView.trailingAnchor, constant: 8),
              
              episode1DownloadButton.centerYAnchor.constraint(equalTo: episode1TitleLabel.centerYAnchor),
              episode1DownloadButton.trailingAnchor.constraint(equalTo: episode1Container.trailingAnchor),
              episode1DownloadButton.widthAnchor.constraint(equalToConstant: 24),
              episode1DownloadButton.heightAnchor.constraint(equalToConstant: 24),
              
              episode1DurationLabel.topAnchor.constraint(equalTo: episode1TitleLabel.bottomAnchor, constant: 2),
              episode1DurationLabel.leadingAnchor.constraint(equalTo: episode1TitleLabel.leadingAnchor),
              
              episode1DescriptionLabel.topAnchor.constraint(equalTo: episode1DurationLabel.bottomAnchor, constant: 4),
              episode1DescriptionLabel.leadingAnchor.constraint(equalTo: episode1TitleLabel.leadingAnchor),
              episode1DescriptionLabel.trailingAnchor.constraint(equalTo: episode1DownloadButton.trailingAnchor),
              episode1DescriptionLabel.bottomAnchor.constraint(equalTo: episode1Container.bottomAnchor),
              
              // Episode 2 container
              episode2Container.topAnchor.constraint(equalTo: episode1Container.bottomAnchor, constant: 20),
              episode2Container.leadingAnchor.constraint(equalTo: episodesContainer.leadingAnchor),
              episode2Container.trailingAnchor.constraint(equalTo: episodesContainer.trailingAnchor),
              episode2Container.bottomAnchor.constraint(lessThanOrEqualTo: episodesContainer.bottomAnchor),
              
              episode2ImageView.leadingAnchor.constraint(equalTo: episode2Container.leadingAnchor),
              episode2ImageView.topAnchor.constraint(equalTo: episode2Container.topAnchor),
              episode2ImageView.widthAnchor.constraint(equalToConstant: 96),
              episode2ImageView.heightAnchor.constraint(equalToConstant: 56),
              
              episode2PlayButton.centerXAnchor.constraint(equalTo: episode2ImageView.centerXAnchor),
              episode2PlayButton.centerYAnchor.constraint(equalTo: episode2ImageView.centerYAnchor),
              episode2PlayButton.widthAnchor.constraint(equalToConstant: 40),
              episode2PlayButton.heightAnchor.constraint(equalToConstant: 40),
              
              episode2TitleLabel.topAnchor.constraint(equalTo: episode2Container.topAnchor),
              episode2TitleLabel.leadingAnchor.constraint(equalTo: episode2ImageView.trailingAnchor, constant: 8),
              
              episode2DownloadButton.centerYAnchor.constraint(equalTo: episode2TitleLabel.centerYAnchor),
              episode2DownloadButton.trailingAnchor.constraint(equalTo: episode2Container.trailingAnchor),
              episode2DownloadButton.widthAnchor.constraint(equalToConstant: 24),
              episode2DownloadButton.heightAnchor.constraint(equalToConstant: 24),
              
              episode2DurationLabel.topAnchor.constraint(equalTo: episode2TitleLabel.bottomAnchor, constant: 2),
              episode2DurationLabel.leadingAnchor.constraint(equalTo: episode2TitleLabel.leadingAnchor),
              
              episode2DescriptionLabel.topAnchor.constraint(equalTo: episode2DurationLabel.bottomAnchor, constant: 4),
              episode2DescriptionLabel.leadingAnchor.constraint(equalTo: episode2TitleLabel.leadingAnchor),
              episode2DescriptionLabel.trailingAnchor.constraint(equalTo: episode2DownloadButton.trailingAnchor),
              episode2DescriptionLabel.bottomAnchor.constraint(equalTo: episode2Container.bottomAnchor),
          ])
      }
    @objc private func dismissSelf() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func zoomingBackgroundView(for transition: ZoomAnimator) -> UIView? {
        nil
    }
    
    func zoomingImageView(for transition: ZoomAnimator) -> UIImageView? {
        return imageView
    }
    
    private func fetchDetaiMovie(){
        let apiService = APIService()
        apiService.fetchMovieDetail(movieID: self.movieID){ result  in
            switch result {
            case.success(let detail):
                DispatchQueue.main.sync {
                    self.movie = detail
                }
                self.movie = detail
            case .failure(let error):
                print(error)
                return
            }
            
        }
    }
    
}

