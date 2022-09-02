//
//  personSettingViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 08/08/22.

import UIKit

class personSettingViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var headingView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var btnBAck: UIButton!
    
    //MARK: Variable Declare
    let LINE_SPCE_IMAGE: CGFloat                = 5
    let CELL_SPCE_IMAGE: CGFloat                = 5
    let COLUMN_IMAGE: CGFloat                   = 3
//    let application = UIApplication()
    
    var arrayOFDelGuy: [ModelDeliveryGuyDetails] = [ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala"),ModelDeliveryGuyDetails(deImage: UIImage(named: "man")!, deName: "Akash Zala")]
    
    override func viewDidLoad() {
      super.viewDidLoad()
        appDelegate.isDeviceportrait = false
        setConstraint()
        registerCell()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        DispatchQueue.main.async {
            appDelegate.resetOrientation()
        }
    }
    
    func setConstraint(){
        view.translatesAutoresizingMaskIntoConstraints = false
        backView.translatesAutoresizingMaskIntoConstraints = false
        if UIApplication.shared.statusBarOrientation.isLandscape == true{
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: self.headingView!, attribute: .top, relatedBy: .equal, toItem: self.backView, attribute: .top, multiplier: 1, constant: 5)
                ,NSLayoutConstraint(item: self.headingView!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 0)
                ,NSLayoutConstraint(item: self.headingView!, attribute: .trailing, relatedBy: .equal, toItem: self.backView, attribute: .trailing, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.headingView!, attribute: .height, relatedBy: .equal, toItem: self.headingView, attribute: .height, multiplier: 1, constant: 50)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 20)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 10)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .height, relatedBy: .equal, toItem: self.btnBAck, attribute: .height, multiplier: 1, constant: 35)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .width, relatedBy: .equal, toItem: self.btnBAck, attribute: .width, multiplier: 1, constant: 35)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .top, relatedBy: .equal, toItem: self.headingView, attribute: .top, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 20)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .width, relatedBy: .equal, toItem: self.myImage, attribute: .width, multiplier: 1, constant: 250)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .top, relatedBy: .equal, toItem: self.headingView, attribute: .top, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .leading, relatedBy: .equal, toItem: self.myImage, attribute: .leading, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .trailing, relatedBy: .equal, toItem: self.backView, attribute: .trailing, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 0)
            ])
        }else{
            NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self.headingView!, attribute: .top, relatedBy: .equal, toItem: self.backView, attribute: .top, multiplier: 1, constant: 52)
            ,NSLayoutConstraint(item: self.headingView!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.headingView!, attribute: .trailing, relatedBy: .equal, toItem: self.backView, attribute: .trailing, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.headingView!, attribute: .height, relatedBy: .equal, toItem: self.headingView, attribute: .height, multiplier: 1, constant: 50)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 20)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 10)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .height, relatedBy: .equal, toItem: self.btnBAck, attribute: .height, multiplier: 1, constant: 35)
            ,NSLayoutConstraint(item: self.btnBAck!, attribute: .width, relatedBy: .equal, toItem: self.btnBAck, attribute: .width, multiplier: 1, constant: 35)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .top, relatedBy: .equal, toItem: self.headingView, attribute: .top, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .trailing, relatedBy: .equal, toItem: self.backView, attribute: .trailing, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myImage!, attribute: .height, relatedBy: .equal, toItem: self.myImage, attribute: .height, multiplier: 1, constant: 250)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .top, relatedBy: .equal, toItem: self.myImage, attribute: .top, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .trailing, relatedBy: .equal, toItem: self.backView, attribute: .trailing, multiplier: 1, constant: 0)
            ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 0)
            ])
        }
    }
    
//    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
//        coordinator.animate(alongsideTransition: { context in
//            if UIApplication.shared.statusBarOrientation.isLandscape == true {
//                NSLayoutConstraint.activate([
//                    NSLayoutConstraint(item: self.headingView!, attribute: .top, relatedBy: .equal, toItem: self.backView, attribute: .top, multiplier: 1, constant: 5)
//                    ,NSLayoutConstraint(item: self.headingView!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 0)
//                    ,NSLayoutConstraint(item: self.headingView!, attribute: .trailing, relatedBy: .equal, toItem: self.backView, attribute: .trailing, multiplier: 1, constant: 0)
//                ,NSLayoutConstraint(item: self.headingView!, attribute: .height, relatedBy: .equal, toItem: self.headingView, attribute: .height, multiplier: 1, constant: 50)
//                ,NSLayoutConstraint(item: self.btnBAck!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 20)
//                ,NSLayoutConstraint(item: self.btnBAck!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 10)
//                ,NSLayoutConstraint(item: self.btnBAck!, attribute: .height, relatedBy: .equal, toItem: self.btnBAck, attribute: .height, multiplier: 1, constant: 35)
//                ,NSLayoutConstraint(item: self.btnBAck!, attribute: .width, relatedBy: .equal, toItem: self.btnBAck, attribute: .width, multiplier: 1, constant: 35)
//                ,NSLayoutConstraint(item: self.myImage!, attribute: .top, relatedBy: .equal, toItem: self.headingView, attribute: .top, multiplier: 1, constant: 0)
//                ,NSLayoutConstraint(item: self.myImage!, attribute: .leading, relatedBy: .equal, toItem: self.backView, attribute: .leading, multiplier: 1, constant: 20)
//                ,NSLayoutConstraint(item: self.myImage!, attribute: .width, relatedBy: .equal, toItem: self.myImage, attribute: .width, multiplier: 1, constant: 250)
//                ,NSLayoutConstraint(item: self.myImage!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 0)
//                ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .top, relatedBy: .equal, toItem: self.headingView, attribute: .top, multiplier: 1, constant: 0)
//                ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .leading, relatedBy: .equal, toItem: self.myImage, attribute: .leading, multiplier: 1, constant: 0)
//                ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .trailing, relatedBy: .equal, toItem: self.backView, attribute: .trailing, multiplier: 1, constant: 0)
//                ,NSLayoutConstraint(item: self.myCollectionView!, attribute: .bottom, relatedBy: .equal, toItem: self.backView, attribute: .bottom, multiplier: 1, constant: 0)
//                ])
//            }else{
//
//            }
//
//        })
//    }
    
//    deinit{
//        DispatchQueue.main.async {
//            self.appDelegate.resetOrientation()
//        }
//    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension personSettingViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    private func registerCell(){
        myCollectionView.register(UINib(nibName: "CollectionViewCell1PSVC", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell1PSVC")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOFDelGuy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell1PSVC", for: indexPath) as? CollectionViewCell1PSVC else {return .init()}
        cell.setupDeliveryGuy(arrayOFDelGuy[indexPath.row])
        return cell
    }
}

extension personSettingViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LINE_SPCE_IMAGE
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CELL_SPCE_IMAGE
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - ((COLUMN_IMAGE - 1) * LINE_SPCE_IMAGE)) / COLUMN_IMAGE
        return CGSize(width: width, height: 135)
    }
}
