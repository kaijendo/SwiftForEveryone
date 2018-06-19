//
//  CustomTableViewCell.swift
//  EnumSearch
//
//  Created by Thuy Truong Quang on 6/19/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit
import AVKit
class CustomTableViewCell: UITableViewCell {
    // MARK: - Properties
    // Variables
    static let identifierName = String(describing: CustomTableViewCell.self)
    static let nibName = String(describing: CustomTableViewCell.self)
    
    var playbackURL: URL?
    var player = AVPlayer()
    var isPlayer: Bool = false {
        didSet {
            let newImage = isPlayer ? #imageLiteral(resourceName: "pause") : #imageLiteral(resourceName: "pause")
            playbackButton.setImage(newImage, for: .normal)
            if isPlayer, let url = playbackURL {
                player.replaceCurrentItem(with: AVPlayerItem(url: url))
                player.play()
            } else {
                player.pause()
            }
        }
    }
    // Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playbackButton: UIButton!
    @IBOutlet weak var scientificNameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var audioPlayerContainer: UIView!
    
    // MARK: - Actions
    @IBAction func togglePlayback(_ sender: UIButton) {
        isPlayer = !isPlayer
    }
    func load(recording: Recording) {
        nameLabel.text = recording.friendlyName
        scientificNameLabel.text = "\(recording.genus) \(recording.species)"
        countryLabel.text = recording.country
        dateLabel.text = recording.date
        
        let playableRecordingURLString = "https:\(recording.fileURL.absoluteString)"
        playbackURL = URL(string: playableRecordingURLString)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying(_:)), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidReachEnd(_:)), name: Notification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
    }
    @objc
    private func playerDidFinishPlaying(_: Notification) {
        isPlayer = false
    }
    @objc
    private func playerDidReachEnd(_: Notification) {
        player.seek(to: kCMTimeZero)
    }
    
    // MARK: - Life circle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        NotificationCenter.default.removeObserver(self)
        isPlayer = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
