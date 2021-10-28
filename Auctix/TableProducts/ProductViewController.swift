//
//  ProductViewController.swift
//  Auctix
//
//  Created by Михаил Шаговитов on 27.10.2021.
//

import Foundation
import UIKit
import PinLayout

protocol ProductViewControllerDelegate: AnyObject {
    func didTapChatButton(productViewController: UIViewController, productId: String)
}

final class ProductViewController: UIViewController {
    var product: Product? {
        didSet {
            guard let product = product else {
                return
            }
            
            configure(with: product)
        }
    }
    
    private let chatButton = UIButton()
    private let productImageView = UIImageView()
    private let priceLabel = UILabel()
    private let titleLabel = UILabel()
    private let nowPrice = UILabel()
    
    weak var delegate: ProductViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Product"
        view.backgroundColor = .systemBackground
        
        chatButton.backgroundColor = .systemIndigo
        chatButton.layer.cornerRadius = 8
        chatButton.setTitle("Chat", for: .normal)
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapCloseButton))
        navigationItem.rightBarButtonItem = closeButton
        //productImageView.contentMode = .scaleAspectFill
        
        priceLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        chatButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        
        chatButton.addTarget(self, action: #selector(didTapChatButton), for: .touchUpInside)

        [productImageView, titleLabel, priceLabel, chatButton].forEach {
            view.addSubview($0)
        }
    }
    
    func configure(with product: Product) {
        productImageView.image = product.productImg
        titleLabel.text = product.title
        priceLabel.text = product.cost
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        productImageView.pin
            .top(view.safeAreaInsets.top)
            .horizontally()
            .height(360)
        
        chatButton.pin
            .below(of: productImageView)
            .marginTop(16)
            .horizontally(12)
            .height(40)
        
        titleLabel.pin
            .below(of: chatButton)
            .marginTop(16)
            .horizontally(12)
            .height(32)
        
        priceLabel.pin
            .below(of: titleLabel)
            .marginTop(12)
            .horizontally(12)
            .height(24)
    }
    
    @objc
    private func didTapCloseButton() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func didTapChatButton() {
        guard let productId = product?.id else {
            return
        }
        //xchtooooo
        delegate?.didTapChatButton(productViewController: self, productId: productId)
    }
}
