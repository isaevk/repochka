//
//  PlayerVC.swift
//  repochka
//
//  Created by Kirill Dev on 09.01.2023.
//

import UIKit
import AVKit

final class PlayerVC: UIViewController {
    
    public var position: Int       = 0
    public var songs: [Song]       = []

    private var player             = AVAudioPlayer()
    private let hideButton         = UIButton()
    private let shareButton        = UIButton()
    private let trackImageView     = UIImageView()
    private let currentTimeLabel   = UILabel()
    private let durationLabel      = UILabel()
    private let albumTitleLabel    = UILabel()
    private let trackTitleLabel    = UILabel()
    private let authorTitleLabel   = UILabel()
    private let previosTrackButton = UIButton()
    private let playPauseButton    = UIButton()
    private let nextTrackButton    = UIButton()
    
    private let currentTimeSlider: UISlider = {
        let slider = UISlider()
        slider.isContinuous = true
        slider.tintColor = .green
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        return slider
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        player.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPlayer()
    }
    
    private func setupUI() {
        [trackImageView, hideButton, shareButton, albumTitleLabel, trackTitleLabel, authorTitleLabel, currentTimeSlider, previosTrackButton, playPauseButton, nextTrackButton, currentTimeLabel, durationLabel].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            hideButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            hideButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            hideButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -260),
            
            shareButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            shareButton.leftAnchor.constraint(equalTo: hideButton.leftAnchor, constant: 300),
            
            albumTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            albumTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            trackImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            trackImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trackImageView.heightAnchor.constraint(equalToConstant: 300),
            trackImageView.widthAnchor.constraint(equalToConstant: 300),
            
            trackTitleLabel.topAnchor.constraint(equalTo: trackImageView.bottomAnchor, constant: 15),
            trackTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            authorTitleLabel.topAnchor.constraint(equalTo: trackTitleLabel.bottomAnchor, constant: 5),
            authorTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            currentTimeSlider.topAnchor.constraint(equalTo: authorTitleLabel.bottomAnchor, constant: 15),
            currentTimeSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentTimeSlider.widthAnchor.constraint(equalToConstant: 300),
            
            currentTimeLabel.leftAnchor.constraint(equalTo: currentTimeSlider.leftAnchor, constant: 5),
            currentTimeLabel.bottomAnchor.constraint(equalTo: currentTimeSlider.topAnchor, constant: 5),
            
            durationLabel.rightAnchor.constraint(equalTo: currentTimeSlider.rightAnchor, constant: -5),
            durationLabel.bottomAnchor.constraint(equalTo: currentTimeSlider.topAnchor, constant: 5),
            
            previosTrackButton.topAnchor.constraint(equalTo: currentTimeSlider.bottomAnchor, constant: 15),
            previosTrackButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            playPauseButton.topAnchor.constraint(equalTo: currentTimeSlider.bottomAnchor, constant: 15),
            playPauseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextTrackButton.topAnchor.constraint(equalTo: currentTimeSlider.bottomAnchor, constant: 15),
            nextTrackButton.rightAnchor.constraint(equalTo: playPauseButton.rightAnchor, constant: 85)
        ])
    }
    
    private func setupPlayer() {
        let song = songs[position]
        let audioPath = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let audioPathURL = URL(string: audioPath!) else { return }
            player = try AVAudioPlayer(contentsOf: audioPathURL)
            
            player.play()
            
        } catch {
            print("error")
        }
        
        setButtons()
        
        trackImageView.image  = UIImage(named: song.imageName)
        albumTitleLabel.text  = song.albumName
        trackTitleLabel.text  = song.name
        authorTitleLabel.text = song.artistName
        currentTimeLabel.text = "00:00"
        durationLabel.text    = "--:--"
        [albumTitleLabel, trackTitleLabel, authorTitleLabel].forEach{ $0.font = .boldSystemFont(ofSize: 20)}
    }
    
    private func setButtons() {
        hideButton.setImage(.init(systemName: "chevron.down"), for: .normal)
        hideButton.addTarget(self, action: #selector(dragDownButtonTapped), for: .touchUpInside)
        
        shareButton.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        previosTrackButton.setImage(UIImage(named: "pre"), for: .normal)
        previosTrackButton.addTarget(self, action: #selector(previosTrack), for: .touchUpInside)
        
        playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
        playPauseButton.addTarget(self, action: #selector(playPouseAction), for: .touchUpInside)
        
        nextTrackButton.setImage(UIImage(named: "next"), for: .normal)
        nextTrackButton.addTarget(self, action: #selector(nextTrack), for: .touchUpInside)
        
        currentTimeSlider.addTarget(self, action: #selector(playbackSliderValueChanged), for: .valueChanged)
    }
    
    @objc private func playbackSliderValueChanged(_ playbackSlider: UISlider) {
        player.currentTime = Double(currentTimeSlider.value) * player.duration
        updateTime()
    }
    
    private func updateTime() {
        currentTimeLabel.text = String(player.currentTime)
        
        let minStr: Int = Int(player.currentTime) / 60
        let secStr: Int = Int(player.currentTime) % 60
        if secStr > 0 && secStr <= 9  {
            currentTimeLabel.text = String("\(minStr):0\(secStr)")
        } else {
            currentTimeLabel.text = String("\(minStr):\(secStr)")
        }
    }
    
    @objc private func dragDownButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @objc private func shareButtonTapped(_ sender: Any) {
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com") else { return }
        let activityVC = UIActivityViewController(activityItems: [image, url], applicationActivities: nil)
        present(activityVC, animated: true)
    }
    
    @objc private func previosTrack(_ sender: Any) {
        if position > -1 {
            position -= 1
            player.stop()
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
            setupUI()
            setupPlayer()
        }
    }
    
    @objc private func nextTrack(_ sender: Any) {
        if position < (songs.count - 1) {
            position += 1
            player.stop()
            for subview in view.subviews {
                subview.removeFromSuperview()
            }
            setupUI()
            setupPlayer()
        }
    }
    
    @objc private func playPouseAction(_ sender: Any) {
        if player.isPlaying {
            player.pause()
            playPauseButton.setImage(UIImage(named: "play"), for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.trackImageView.widthAnchor.constraint(equalToConstant: 300 - 20).isActive  = true
                self.trackImageView.heightAnchor.constraint(equalToConstant: 300 - 20).isActive = true
            })
            
        } else {
            player.play()
            playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.trackImageView.widthAnchor.constraint(equalToConstant: 300).isActive  = true
                self.trackImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
            })
        }
    }
}

