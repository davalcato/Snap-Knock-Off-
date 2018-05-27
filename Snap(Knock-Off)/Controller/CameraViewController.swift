//
//  MiddleView.swift
//  Snap(Knock-Off)
//
//  Created by Daval Cato on 5/22/18.
//  Copyright © 2018 Daval Cato. All rights reserved.
//

import UIKit
import AVFoundation


class CameraViewController: UIViewController {
    
    var captureSession = AVCaptureSession()
    
    // which camera input do we want to use
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    
    // output device
    var stillImageOutput:  AVCapturePhotoOutput?
    var stillImage: UIImage?
    
    // camera preview layer
    var cameraPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession.sessionPreset = AVCaptureSession.Preset.photo
        
        let deviceDescoverySession = AVCaptureDevice.DiscoverySession.init(deviceTypes: [AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: AVMediaType.video,
            position: AVCaptureDevice.Position.unspecified); let devices = deviceDescoverySession.devices
        
//        for device in devices {
//            if device.position == .back {
//                backFacingCamera = device
//            } else if device.position == .front {
//                frontFacingCamera = device
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                backFacingCamera = device
            } else if device.position == AVCaptureDevice.Position.front {
                frontFacingCamera = device
            }
            
        }
        
        // default device
        currentDevice = frontFacingCamera
        
        // configure the session with the output for capturing our still image
//        stillImageOutput = AVCapturePhotoOutput()
//        stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
//        let stimageout = AVCapturePhotoOutput()
//        let settings = AVCapturePhotoSettings()
//
//        if #available(iOS 11.0, *) {
//            settings.livePhotoVideoCodecType = .jpeg
//        } else {
//            // Fallback on earlier versions
//        };if #available(iOS 11.0, *) {
//            settings.livePhotoVideoCodecType = .jpeg
//        } else {
//            // Fallback on earlier versions
//        }
//        stimageout.capturePhoto(with: settings, delegate: self as! AVCapturePhotoCaptureDelegate)
        
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentDevice!)
            
            captureSession.addInput(captureDeviceInput)
            captureSession.addOutput(stillImageOutput!)
            
            // set up the camera preview layer
            cameraPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            view.layer.addSublayer(cameraPreviewLayer!)
            cameraPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            cameraPreviewLayer?.frame = view.layer.frame
            
            
            captureSession.startRunning()
        } catch let error {
            print(error)
        }
        
    }
    
    @IBAction func shutterButtonDidTap(_ sender: Any) {
        
        
    }
    
}
