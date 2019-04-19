//
//  ViewController.swift
//  video
//
//  Created by Tsai Cary on 2019/4/17.
//  Copyright © 2019 Tsai Cary. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Photos
import MobileCoreServices








//        http://techslides.com/demos/sample-videos/small.mp4

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var cameraVIew: CustomPlayerView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoTableViewCell") as! videoTableViewCell

        
        if indexPath.row == 2 {
            
            let videoURL = URL(fileURLWithPath: mUrlCamera)
            let playerItem = AVPlayerItem(url: videoURL)
            let player = AVPlayer(playerItem: playerItem)
            cell.playerView.playerLayer.player = player

        }else{
            
            let url = mUrlArror[indexPath.row]
            let avPlayer = AVPlayer(url: URL(string: url)!)
            cell.playerView.playerLayer.player = avPlayer

        }
        
            cell.playerView.playerLayer.player?.play()


        
        
        
        
        return cell
        
    }
    
    

    
    @IBOutlet weak var tsbleView: UITableView!
    

    var mUrlArror = [String]()
    var mUrlCamera = ""
    let imagePickerController = UIImagePickerController()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mUrlArror.append("http://techslides.com/demos/sample-videos/small.mp4")
        mUrlArror.append("http://yt-dash-mse-test.commondatastorage.googleapis.com/media/car-20120827-85.mp4")
        
        tsbleView.register(UINib(nibName:"videoTableViewCell", bundle:nil),forCellReuseIdentifier:"videoTableViewCell")
        tsbleView.delegate = self
        tsbleView.dataSource = self
        imagePickerController.delegate = self
        imagePickerController.modalTransitionStyle = .flipHorizontal
        imagePickerController.allowsEditing = true




    }
    
    
    func setCamera(){
        
//        let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)

//        if imagePickerController.cameraCaptureMode == .photo{
        
            imagePickerController.sourceType = UIImagePickerController.SourceType.camera
            imagePickerController.mediaTypes = [kUTTypeMovie as String]
            
            imagePickerController.videoQuality = UIImagePickerController.QualityType.typeHigh
            imagePickerController.videoMaximumDuration = 10
            imagePickerController.cameraCaptureMode = UIImagePickerController.CameraCaptureMode.video
            
            self.present(imagePickerController, animated: true, completion: nil)
            
//        }
        
     

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let Url = info[UIImagePickerController.InfoKey.mediaURL] as? URL {
            
            print("Urlsssssss",Url)
            mUrlCamera = Url.path
//            UISaveVideoAtPathToSavedPhotosAlbum(Url.path, self, nil, nil)

 
            tsbleView.reloadData()
//            let playerLayer = AVPlayerLayer(player: player)
//            playerLayer.frame = self.cameraVIew.bounds
//            self.cameraVIew.layer.addSublayer(playerLayer)

//            cameraVIew.playerLayer.player = player
//            cameraVIew.player?.play()
            
            
        }
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func cameraAction(_ sender: UIButton) {
        let cameraStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch cameraStatus {
        case .authorized:
            self.setCamera()
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status {
                    self.setCamera()
                }else{
                    self.showSettingPermissionAlertView(title:
                        NSLocalizedString("", comment: ""), message:
                        NSLocalizedString("", comment: ""))
                }
            }
        default:
            
            print("")

        }
        
        
    }
    
    func showSettingPermissionAlertView(title:String,message:String){
        
        let alertController = UIAlertController(title: title, message:message , preferredStyle: .alert)
//        alertController.view.tintColor = UIColor(hexString: ColorData.mollyFontBlack)
        let cancelAction = UIAlertAction(title: NSLocalizedString("取消", comment: ""), style: .cancel, handler: nil)
        let settingAction = UIAlertAction(title: NSLocalizedString("確定", comment: ""), style: .default) { (action) in
            let url = URL(string: UIApplication.openSettingsURLString)
            if let url = url, UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                    print(success)
                })
            }
            
        }
        alertController.addAction(settingAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    

}

