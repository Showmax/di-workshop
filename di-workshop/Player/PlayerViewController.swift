//
//  MasterViewController.swift
//  test
//
//  Created by Showmax on 11/05/2020.
//  Copyright © 2020 Showmax. All rights reserved.
//

import UIKit
import AVKit

class PlayerViewController: AVPlayerViewController {

    let model: PlayerModel

    init(model: PlayerModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Player"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model.loadState()
        switch model.state {
        case .loading:
            break
        case .loaded(let title, let url, let progress):
            self.title = title
            player = AVPlayer(url: url)
            player?.play()
            if progress > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    self?.seekToPercentProgress(progress)
                }
            }
        }
        player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC)), queue: .main) { [weak self] time in
            self?.reportWatchingProgress(time: time)
        }
    }

    private func reportWatchingProgress(time: CMTime) {
        guard let duration = player?.currentItem?.duration else { return }
        let percent = 1/CMTimeGetSeconds(duration)*CMTimeGetSeconds(time)
        model.rememberWatchingProgress(percent)
    }

    private func seekToPercentProgress(_ progress: Double) {
        guard let duration = player?.currentItem?.duration else { return }
        let time: CMTime = CMTime(seconds: progress*CMTimeGetSeconds(duration), preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player?.seek(to: time, toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
    }
}

