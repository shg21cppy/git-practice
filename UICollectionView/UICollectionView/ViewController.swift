//
//  ViewController.swift
//  UICollectionView
//
//  Created by 上野 翔碁 on 2025/09/11.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        $0.register(ImageLabelCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        $0.delegate = self
        $0.dataSource = self
        return $0
    }(UICollectionView(
        frame: .zero,
        collectionViewLayout: setupCollectionViewLayout()
    ))

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        

    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    // 各セルのサイズを指定
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width // 横幅いっぱい
        return CGSize(width: width, height: 80) // 高さは任意
    }
    
    // セル間の縦スペース
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 10
    }
    
    // セクションの余白
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return .zero
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 1000
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "Cell",
            for: indexPath
        )
        cell.label.text = titleLabelText[indexPath.row]
        cell.backgroundColor = .green

        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("セル \(indexPath.item) がタップされました")
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = .blue
        }
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didDeselectItemAt indexPath: IndexPath
    ) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.backgroundColor = .white
        }
    }
}
