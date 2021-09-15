//
//  ArabicTableViewCell.swift
//  WaqfIbtida
//
//  Created by Luthfi Abdurrahim on 14/09/21.
//

import UIKit

class ArabicTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var viewWrapper: UIView!
    
    var arabData: [[String]] = [[""]]
    var translationData: [[String]] = [[""]]    
    var cellTableRow = 0
    var currentTableView = UITableView()
    
    

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.checkAction))
        self.viewWrapper.addGestureRecognizer(gesture)

        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let heightCollectionView = self.collectionView.contentSize.height
            self.collectionViewHeight.constant = heightCollectionView
            self.collectionView.reloadData()
            self.currentTableView.reloadData()
            self.viewWrapper.layer.cornerRadius = heightCollectionView * 0.15
        }
    }
    
    @objc func checkAction(sender : UITapGestureRecognizer) {
        // Do what you want
        print("checkedactionisit")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


extension ArabicTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arabData[self.cellTableRow].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WordCollectionViewCell", for: indexPath) as? WordCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.arabicLabel.text = arabData[self.cellTableRow][indexPath.row]
        cell.translationLabel.text = translationData[self.cellTableRow][indexPath.row]
        
        return cell
    }
    
    
}
