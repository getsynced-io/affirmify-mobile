//
//  VideoCard.swift
//  Affirmify
//
//  Created by Fares Cherni on 24/05/2023.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct VideoCard: View {
    var video: AnnimatedThemesModel
    let width : CGFloat = (UIScreen.main.bounds.width - 16 * 5) / 3
    @StateObject var themeVM : ThemeViewModel = ThemeViewModel.shared
    var urlToPlay : URL? {
        if  themeVM.readyVieos.contains(video.id){
         return    VideoManager.shared.getFileURL(for: video.id)
        }
        else {
            return nil
        }
    }
    
 

    var body: some View {
        
        ZStack(alignment: .topTrailing){
     
                if let urlToPlay = urlToPlay {
                    PlayerViewController(url: urlToPlay)
                        .frame(width: width,height: width * 1.77)
                        .cornerRadius(16)
                }
            else {
                Image(video.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width,height: width * 1.77)
                    .cornerRadius(16)
                
            }
                
            
    
            Image(video.id ==  ThemeViewModel.shared.AnimatedVidID ?  "circle-check" : "circle")
                    .frame(width: 24,height: 24)
                    .padding(8)
            
            
        }
    
    }
    
}



struct VideoCardPager: View {
    @StateObject var themeVM : ThemeViewModel = ThemeViewModel.shared
    @State var refresher : Bool = false
    let width : CGFloat = (UIScreen.main.bounds.width - 16 * 5) / 3
    var video :  AnnimatedThemesModel? {
      AnnimatedThemesModel.animatedThemes.first(where: { video in video.id == themeVM.AnimatedVidID})
    }
    var urlToPlay : URL? {
        guard let video = video else {return nil }
        print("videoIDvideoID \(video.id)")
        if  themeVM.readyVieos.contains(video.id){
         return    VideoManager.shared.getFileURL(for: video.id)
        }
        else {
            return nil
        }
        
    }


    var body: some View {
        
        ZStack(alignment: .topTrailing){
            ZStack {
                if let urlToPlay = urlToPlay {
                    if refresher {
                        videoToPlay(url: urlToPlay)
                    }
                    else {
                        videoToPlay(url: urlToPlay)
                    }

                }
                else if let video = video {
                    Image(video.id)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
                    
                }
                
            }
       
            
        }
        .onChange(of: themeVM.AnimatedVidID) { newValue in
            refresher.toggle()
        }
    }
    
    func  videoToPlay(url : URL ) -> some View {
        PlayerViewController(url: url)
            .frame(width: UIScreen.main.bounds.width)
            .frame(height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
    }
    
}

//
//struct PlayerViewController: UIViewControllerRepresentable {
//
//    let url : URL
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let player: AVPlayer = AVPlayer(url: url)
//        let controller = AVPlayerViewController()
//
//        controller.modalPresentationStyle = .automatic
//        controller.player = player
//
//        // Loop the video
//        controller.player?.actionAtItemEnd = .none
//        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: .main) { _ in
//            controller.player?.seek(to: CMTime.zero)
//            controller.player?.play()
//        }
//        controller.showsPlaybackControls = false
//        controller.videoGravity = .resizeAspectFill
//        controller.player?.play()
//        return controller
//    }
//
//    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
//        playerController.player?.pause()
//        playerController.player?.seek(to: .zero)
//        playerController.player = AVPlayer(url: url)
//        playerController.player?.play()
//    }
//}
//
//
//
//

//struct PlayerViewController: UIViewControllerRepresentable {
//
//    let url : URL
//
//    func makeUIViewController(context: Context) -> AVPlayerViewController {
//        let player: AVQueuePlayer = AVQueuePlayer()
//        let controller = AVPlayerViewController()
//
//        controller.modalPresentationStyle = .automatic
//        controller.player = player
//
//        // Loop the video
//        let playerItem = AVPlayerItem(url: url)
//        let playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
//
//        controller.showsPlaybackControls = false
//        controller.videoGravity = .resizeAspectFill
//        controller.player?.play()
//
//        return controller
//    }
//
//    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
////        playerController.player?.pause()
////        playerController.player?.seek(to: .zero)
////        playerController.player?.replaceCurrentItem(with: AVPlayerItem(url: url))
////        playerController.player?.play()
//    }
//}




struct PlayerViewController: UIViewRepresentable {
    let url : URL
    
    func updateUIView(_ uiView: LoopingPlayerUIView, context: UIViewRepresentableContext<PlayerViewController>) {

    }

    func makeUIView(context: Context) -> LoopingPlayerUIView {
        return LoopingPlayerUIView(frame: .zero,url : url)
    }
}


class LoopingPlayerUIView: UIView {
     let playerLayer = AVPlayerLayer()
     var playerLooper: AVPlayerLooper?

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   init(frame: CGRect, url : URL) {
        super.init(frame: frame)

        let item = AVPlayerItem(url: url)
        
        // Setup the player
        let player = AVQueuePlayer()
        player.volume = 0.0
         
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
         
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        // Start the movie
        player.play()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
