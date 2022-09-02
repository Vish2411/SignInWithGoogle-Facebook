//
//  delhiveryViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 04/08/22.
//

import UIKit



class delhiveryViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var myTableView: UITableView!
    
    var arrayOfPoint = ["One","Two","Three","four","Five","Six"]
   
    var tempArray = [String]()
    var arrSelectedIndex = [Int]()
    
    var arrayOfOne = ["AAA","BBB","CCC","DDD","EEE","FFF","GGG","HHH","III","JJJ","KKK","LLL","MMM","LLL","MMM","DDD","EEE","AAA","GGG","HHH","QQQ","JJJ","KKK","BBB","BBB","CCC","DDD","EEE","FFF","GGG","HHH","III","JJJ","KKK","LLL","MMM","LLL","MMM","DDD","EEE","AAA","GGG","HHH","QQQ","JJJ","KKK","BBB","BBB"]
    
    var arrayOfTwo = ["III","LLL","MMM","DDD","EEE","AAA","GGG","HHH","QQQ","JJJ","KKK","BBB","BBB"]
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    
    
    private func registerCell(){
        myCollectionView.register(UINib(nibName: "CollectionViewCelldel1", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCelldel1")
        myTableView.register(UINib(nibName: "TableViewCell1", bundle: nil), forCellReuseIdentifier: "TableViewCell1")
    }
    
    
    
    func updateValue(index: Int) {
            if arrSelectedIndex.contains(index) {
                if let index = arrSelectedIndex.firstIndex(where: {$0 == index}) {
                    arrSelectedIndex.remove(at: index)
                }
            } else {
                arrSelectedIndex.append(index)
            }
            myTableView.reloadData()
        }
    
    @objc func btnCheckMarkAction( sender:UIButton){
        updateValue(index: sender.tag)
        }

    @IBAction func btnFilterData(_ sender: Any) {
        let arr = arrSelectedIndex.map {
        index in return arrayOfOne[index]
        }
        print(arr)
        
        let activityVc = UIActivityViewController(activityItems: [arr], applicationActivities: nil)
        activityVc.popoverPresentationController?.sourceView = self.view
        self.present(activityVc, animated: true, completion: nil)
    }
    

}
extension delhiveryViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPoint.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCelldel1", for: indexPath) as? CollectionViewCelldel1 else{return .init()}
        cell.lblPOint.text = arrayOfPoint[indexPath.row]
//        cell.checkBox.isHidden = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        myTableView.reloadData()
    }
}

extension delhiveryViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 41
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedIndex == 0{
            return arrayOfOne.count
        }else if selectedIndex == 1{
            return arrayOfTwo.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1", for: indexPath) as? TableViewCell1 else{return .init()}
        cell.checkBox.isHidden = false
        if selectedIndex == 0{
            cell.checkBox.addTarget(self, action: #selector(btnCheckMarkAction( sender:)), for: .touchUpInside)
            
            cell.lblTableView1.text = arrayOfOne[indexPath.row]
                    if arrSelectedIndex.contains(indexPath.row) {
                        cell.checkBox.isSelected = true
                    } else {
                        cell.checkBox.isSelected = false
                    }
                    cell.checkBox.tag = indexPath.row
            
        }else if selectedIndex == 1{
            cell.lblTableView1.text = arrayOfTwo[indexPath.row]
            
            cell.checkBox.isHidden = true

        }else{
            cell.lblTableView1.text = "Empty"
        }
//        myTableView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        updateValue(index: indexPath.row)
        print("Selected")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselcted")
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
//            cell.layer.transform = rotationTransform
//            cell.alpha = 0.5
//
//            UIView.animate(withDuration: 0.5){
//                cell.layer.transform = CATransform3DIdentity
//                cell.alpha = 1.0
//            }
    
        /*
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        UIView.animate(withDuration: 1, animations: {
                cell.layer.transform = CATransform3DMakeScale(2,2,2)
            })
        UIView.animate(withDuration: 0.3, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
         */
    }
}

extension delhiveryViewController : UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let width: CGFloat = (collectionView.frame.width - ((5 - 1) * 0)) / 5
//        return CGSize(width: width, height: 30)
//    }
}

