//
//  TableViewCell.swift
//  dragFileToTrash
//
//  Created by Robin Mehta on 8/18/16.
//  Copyright © 2016 robin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var array : NSMutableArray?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //        layout.minimumColumnSpacing = 3.0
        layout.minimumInteritemSpacing = 10000
        //        layout.headerHeight = 3.0
        layout.minimumLineSpacing = 10.0
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.autoresizingMask = [UIViewAutoresizing.FlexibleHeight, UIViewAutoresizing.FlexibleWidth]
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = .whiteColor()
        collectionView.pagingEnabled = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.contentView.addSubview(collectionView)
        return collectionView
    }()
    
    func layoutViews() {
        self.contentView.backgroundColor = UIColor.whiteColor()
        collectionView.pinToEdgesOfSuperview()
    }
    
    // MARK: - Collection View Delegate Methods
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! UICollectionViewCell
        
        if let array = array {
            let imageView = UIImageView(image: array[indexPath.row] as? UIImage)
            cell.backgroundView = imageView
            
            cell.userInteractionEnabled = true
            cell.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(TableViewCell.handlePan)))
        }
        
        //        guard indexPath.row < Feed.sharedInstance.items.count else {
        //            return cell
        //        }
        
        //let product = Feed.sharedInstance.items[indexPath.row]
        
        //        if let productID = cell.productID where productID == product.id {
        //            return cell
        //        }
        
        //        if let productDescription = cell.productDescription where productDescription == product.description {
        //            return cell
        //        }
        //
        //        cell.product = product
        
        //        imageLoading[indexPath.row] = true
        
        //        cell.setImage(product.imageURL) { (completed, image) in
        //            if completed {
        //                dispatch_async(dispatch_get_main_queue()) {
        //                    self.imageLoading[indexPath.row] = false
        //                    Feed.sharedInstance.setSize((image?.size)!, atIndex: indexPath.row)
        //
        //                    if (self.imageLoading.indexOf(true) == nil && !LoadingView.sharedInstance.hasHiddenOnce) {
        //                        LoadingView.sharedInstance.hasHiddenOnce = true
        //                        self.collectionView.reloadData()
        //                        LoadingView.sharedInstance.hideView()
        //                    }
        //                }
        //            }
        //        }
        
        
        
        cell.backgroundColor = UIColor.greenColor()
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(50, 50)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //        let productViewController = ProductViewController()
        //
        //        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! FeedCell
        //
        //        let product = Feed.sharedInstance.items[indexPath.row]
        //        productViewController.product = product
        //        productViewController.imageURLs = product.imageURLs
        //        productViewController.mainImage = cell.image
        //        productViewController.delegate = self
        //
        //        // Record in mobile analytics
        //        AnalyticsManager.sharedInstance.recordEvent(Event.Feed.ItemCellPressed)
        //        
        //        transitionToProduct(fromIndex: indexPath) {completion in
        //            self.presentViewController(productViewController, animated: false, completion: completion)
    }

    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutViews()
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(contentView)
        recognizer.view!.center = CGPointMake(recognizer.view!.center.x + translation.x, recognizer.view!.center.y + translation.y)
        
        recognizer.setTranslation(CGPointMake(0, 0), inView: contentView)

    }
    
}
