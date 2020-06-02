//
//  IntroViewController.swift
//  iMallsApp
//
//  Created by Eman Gaber on 5/27/20.
//  Copyright © 2020 Mohamed Shendy. All rights reserved.
//

import UIKit
import FSPagerView
import MOLH

class IntroViewController: UIViewController {
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(UINib(nibName: "Intro1", bundle: nil), forCellWithReuseIdentifier: "Intro1")
            
            self.pagerView.register(UINib(nibName: "Intro2", bundle: nil), forCellWithReuseIdentifier: "Intro2")
            
            self.pagerView.register(UINib(nibName: "Intro3", bundle: nil), forCellWithReuseIdentifier: "Intro3")
            
            
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.pagerView.reloadData()
        btnSkip.setTitle(sDefaults().getStringForKey(key:"Pages.Intro.Skip"), for: .normal)
        if MOLHLanguage.currentAppleLanguage() == "ar"
        {
//            let image = btnSkip.imageView!
//            btnSkip.setTitleColor(UIColor.red, for: .normal)
            btnSkip.transform = CGAffineTransform(scaleX: -1.0, y: -1.0)
            
            
        }
   
    }
    
    @IBAction func SkipToLogin()
      {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "MaleAndFemalViewController")as! MaleAndFemalViewController
          
           vc.modalPresentationStyle = .fullScreen
          self.present(vc, animated: true, completion: nil)
      }
    
    
    
}

extension IntroViewController : FSPagerViewDataSource, FSPagerViewDelegate {
    
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 3
    }
    
  
    
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        
        if index == 0 {
            
            let cell1 = pagerView.dequeueReusableCell(withReuseIdentifier: "Intro1", at: index) as! Intro1
            cell1.lblName.text = sDefaults().getStringForKey(key:"Pages.Intro.Name3")
            cell1.lblDesc.text = sDefaults().getStringForKey(key:"Pages.Intro.Desc3")
            
            return cell1
            
        }else if index == 1 {
            
            let cell2 = pagerView.dequeueReusableCell(withReuseIdentifier: "Intro2", at: index) as! Intro2
            cell2.lblName.text = sDefaults().getStringForKey(key:"Pages.Intro.Name2")
            cell2.lblDesc.text = sDefaults().getStringForKey(key:"Pages.Intro.Desc2")
            return cell2
        }
        else {
            
            let cell3 = pagerView.dequeueReusableCell(withReuseIdentifier: "Intro3", at: index) as! Intro3
            cell3.lblName.text = sDefaults().getStringForKey(key:"Pages.Intro.Name3")
            cell3.lblDesc.text = sDefaults().getStringForKey(key:"Pages.Intro.Desc3")
            return cell3
        }
        
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
    }
    //
    //    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
    ////        self.bannerPageControl.currentPage = targetIndex
    //        self.bannerIndicatorCollectionView.reloadData()
    //
    //    }
    ////
    //    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
    ////        self.bannerPageControl.currentPage = pagerView.currentIndex
    //    }
    //    func pagerViewDidScroll(_ pagerView: FSPagerView) {
    //        self.bannerIndicatorCollectionView.reloadData()
    //
    //    }
}
extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.y, y: -origin.x,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return rotatedImage ?? self
        }

        return self
    }
}
