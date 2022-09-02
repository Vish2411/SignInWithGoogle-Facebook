//
//  ViewController.swift
//  pageControllerAppDemo
//
//  Created by iMac on 01/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnNextOulet: UIButton!
    
    
    var slides = [pageModel(title: "Delicious Dishes", description: "Experience a Variety of Amazing dishes from diffrent calctures aroud the world", pageImage: UIImage(named: "deshies2")!),
                  pageModel(title: "Door-Step Delivey", description: "Your Safity is Our Must priority", pageImage: UIImage(named: "safe")!),
                  pageModel(title: "Fast Shipping", description: "YOur Time Is important For us", pageImage: UIImage(named: "delivery3")!)
                 ]
    
    var currentpage = 0{
        didSet{
            pageControl.currentPage = currentpage
            if currentpage == slides.count - 1{
                btnNextOulet.setTitle("Get Started", for: .normal)
            }else{
                btnNextOulet.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        
        if currentpage == slides.count - 1 {
            print("go To Next Page")
            let svc = self.storyboard?.instantiateViewController(withIdentifier: "welcomeViewController") as! welcomeViewController
            
            let nav = UINavigationController(rootViewController: svc)
            nav.modalPresentationStyle = .overFullScreen
            nav.modalTransitionStyle = .flipHorizontal
            nav.isNavigationBarHidden = true
            self.present(nav, animated: true, completion: nil)
        }else{
            currentpage += 1
            let indexpath = IndexPath(item: currentpage, section: 0)
            myCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)            //Why Do This?
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let width = scrollView.frame.width
            currentpage = Int(scrollView.contentOffset.x/width)                         //Why Do This ?
        }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "slidesCollectionViewCell", for: indexPath) as! slidesCollectionViewCell
        cell.slideSetUp(slides[indexPath.row])
//        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width, height: myCollectionView.frame.height)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
            cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
                cell.alpha = 1
                cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
            })
        
//        UIView.animate(withDuration: 1.0, delay: 1.5, options: [.repeat, .beginFromCurrentState], animations: {
//          cell.alpha = 1
//                cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
//
//        }, completion: nil)
    }

}
