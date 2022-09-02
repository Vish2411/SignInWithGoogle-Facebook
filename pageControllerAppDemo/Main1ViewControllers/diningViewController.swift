//
//  diningViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 03/08/22.
//

import UIKit

class diningViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView1: UICollectionView!
    @IBOutlet weak var myCollectionView2: UICollectionView!
    @IBOutlet weak var myCollectionView3: UICollectionView!
    
    
    let LINE_SPCE_IMAGE: CGFloat                = 5
    let CELL_SPCE_IMAGE: CGFloat                = 5
    let COLUMN_IMAGE: CGFloat                   = 2
    
    var arrayOFDishes = [ModelCategoryDish(imageDish: UIImage(named: "dishes")!, lblDish: "Indian Dish"),
                         ModelCategoryDish(imageDish: UIImage(named: "dishes")!, lblDish: "Indian Dish"),
                         ModelCategoryDish(imageDish: UIImage(named: "dishes")!, lblDish: "Indian Dish"),
                         ModelCategoryDish(imageDish: UIImage(named: "dishes")!, lblDish: "Indian Dish"),
                         ModelCategoryDish(imageDish: UIImage(named: "dishes")!, lblDish: "Indian Dish"),
                         ModelCategoryDish(imageDish: UIImage(named: "dishes")!, lblDish: "Indian Dish"),
                         ModelCategoryDish(imageDish: UIImage(named: "dishes")!, lblDish: "Indian Dish")]
    
    var arrayOfPopDishes = [ModelPopDish(popInage: UIImage(named: "dishes")!, popName: "Indian Dish", popCalaries: "320 calaris"),
                            ModelPopDish(popInage: UIImage(named: "dishes")!, popName: "Indian Dish", popCalaries: "320 calaris"),
                            ModelPopDish(popInage: UIImage(named: "dishes")!, popName: "Indian Dish", popCalaries: "320 calaris"),
                            ModelPopDish(popInage: UIImage(named: "dishes")!, popName: "Indian Dish", popCalaries: "320 calaris"),
                            ModelPopDish(popInage: UIImage(named: "dishes")!, popName: "Indian Dish", popCalaries: "320 calaris"),
                            ModelPopDish(popInage: UIImage(named: "dishes")!, popName: "Indian Dish", popCalaries: "320 calaris")]
    
    var arrayOFSpeDishes = [ModelSpeDish(speImage: UIImage(named: "dishes")!, speName: "Italian Special Chief Dish", speCalaries: "330 Calaries"),
                            ModelSpeDish(speImage: UIImage(named: "dishes")!, speName: "Italian Special Chief Dish", speCalaries: "330 Calaries"),
                            ModelSpeDish(speImage: UIImage(named: "dishes")!, speName: "Italian Special Chief Dish", speCalaries: "330 Calaries"),
                            ModelSpeDish(speImage: UIImage(named: "dishes")!, speName: "Italian Special Chief Dish", speCalaries: "330 Calaries"),
                            ModelSpeDish(speImage: UIImage(named: "dishes")!, speName: "Italian Special Chief Dish", speCalaries: "330 Calaries")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        xibRegister()
        collectionViewAssignDelegateAndDataSource()
        // Do any additional setup after loading the view.
    }
    
    func collectionViewAssignDelegateAndDataSource(){
        myCollectionView1.delegate = self
        myCollectionView1.dataSource = self
        myCollectionView2.delegate = self
        myCollectionView2.dataSource = self
        myCollectionView3.delegate = self
        myCollectionView3.dataSource = self
    }
}


extension diningViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    private func xibRegister(){
        myCollectionView1.register(UINib(nibName: "CollectionViewCell1", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell1")
        myCollectionView2.register(UINib(nibName: "CollectionViewCell2", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell2")
        myCollectionView3.register(UINib(nibName: "CollectionViewCell3", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell3")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myCollectionView1{
            return arrayOFDishes.count
        }else if collectionView == myCollectionView2{
            return arrayOfPopDishes.count
        }else{
            return arrayOFSpeDishes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == myCollectionView1{
            guard let cell = myCollectionView1.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell1", for: indexPath) as? CollectionViewCell1 else{return .init()}
            cell.setupDishes(arrayOFDishes[indexPath.row])
            return cell
            
        }else if collectionView == myCollectionView2{
            guard let cell2 = myCollectionView2.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as? CollectionViewCell2 else{return .init()}
            cell2.setPopularDish(arrayOfPopDishes[indexPath.row])
            return cell2
            
        }else{
            guard let cell3 = myCollectionView3.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell3", for: indexPath) as? CollectionViewCell3 else { return .init()}
            cell3.setSpecialDishes(arrayOFSpeDishes[indexPath.row])
            return cell3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activetyVC = UIActivityViewController(activityItems: [indexPath.row], applicationActivities: nil)
        activetyVC.popoverPresentationController?.sourceView = self.view
        self.present(activetyVC, animated: true, completion: nil)
    }
}

extension diningViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == myCollectionView1{
            return LINE_SPCE_IMAGE
        }else if collectionView == myCollectionView2{
            return 0
        }else{
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == myCollectionView1{
            return CELL_SPCE_IMAGE
        }else if collectionView == myCollectionView2{
            return 10
        }else{
            return 10
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == myCollectionView1{
            let width: CGFloat = (collectionView.frame.width - ((COLUMN_IMAGE - 1) * LINE_SPCE_IMAGE)) / COLUMN_IMAGE
            return CGSize(width: width, height: 45)
        }else if collectionView == myCollectionView2{
            let width: CGFloat = (collectionView.frame.width - ((3 - 1) * 0)) / 3
            return CGSize(width: width, height: 210)
        }else{
            let width: CGFloat = ((collectionView.frame.width - ((1 - 1) * 0)) / 1) - 30
            return CGSize(width: width, height: 85)
        }
        
    }

}

