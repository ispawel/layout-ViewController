//
//  PersonnelReserveViewController.swift
//  SPAR Dev
//
//  Created by Pavel Isakov on 05.08.2022.
//

import Foundation
import UIKit
import SPARDesignSystem

final class PersonnelReserveViewController: UIViewController, UIGestureRecognizerDelegate{

    private enum Constants {
        static let txtForLabel  = "Кадровый резерв — это квалифицированные специалисты, отвечающие повышенным требованиям и отобранные для потенциального занятия руководящей должности на предприятии"
        static let txtForBanner1 = "Кадровый резерв"
        static let txtForBanner2 = "Заявки в Кадровый резерв"
        static let txtForBanner3 = "Отчет по Кадровому резерву"
        static let txtForBanner4 = "Индивидуальный план развития"
        
        enum LinksForButtons {
            static let linkBanner1 = "https://myspar.ru"
            static let linkBanner2 = "https://myspar.ru/order/"
            static let linkBanner3 = "https://myspar.ru/promo/"
            static let linkBanner4 = "https://myspar.ru/career/"
        }
        enum Offset {
            static let bannerSize: CGFloat = 110
            static let scrollViewTop: CGFloat = 100
            static let leftOffset: CGFloat = 17
            static let banner1ViewHeight: CGFloat = bannerSize + 27
        }
    }
    
    private var contentSizeScroll: CGSize {
        CGSize(width: bannerView1.frame.width, height: view.frame.height + 50)
    }
    
    private lazy var myScrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.frame = view.bounds
        $0.contentSize = contentSizeScroll
        return $0
    }(UIScrollView())
    
    private lazy var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.frame.size = contentSizeScroll
        $0.spacing = 20
        return $0
    }(UIStackView())
    
    private lazy var bannerView1: BannerView = {
        $0.frame = .zero
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(BannerView())
    
    private lazy var buttonBanner1: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(pressButtons), for: .touchUpInside)
        return $0
    }(UIButton())
    
    private lazy var textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = Fonts.body
        $0.numberOfLines = 0
        $0.text = Constants.txtForLabel
        return $0
    }(UILabel())
    
    private lazy var bannerView2: BannerView = {
        $0.frame = .zero
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(BannerView())
    
    private lazy var buttonBanner2: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(pressButtons), for: .touchUpInside)
        return $0
    }(UIButton())

    private lazy var bannerView3: BannerView = {
        $0.frame = .zero
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(BannerView())
    
    private lazy var buttonBanner3: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(pressButtons), for: .touchUpInside)
        return $0
    }(UIButton())
 
    private lazy var bannerView4: BannerView = {
        $0.frame = .zero
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(BannerView())
    
    private lazy var buttonBanner4: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(pressButtons), for: .touchUpInside)
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        self.view.addSubview(myScrollView)
        self.myScrollView.showsVerticalScrollIndicator = false
        self.myScrollView.addSubview(stackView)

        self.stackView.addArrangedSubview(bannerView1)
        bannerView1.setData(title: Constants.txtForBanner1,
                           image: Images.HRProcesses.man1!,
                           backgroundColor: Colors.widgetRed)
        self.bannerView1.addSubview(buttonBanner1)

        self.stackView.addArrangedSubview(textLabel)
        
        self.stackView.addArrangedSubview(bannerView2)
        bannerView2.setData(title: Constants.txtForBanner2,
                           image: Images.HRProcesses.man3!,
                           backgroundColor: Colors.widgetOrange)
        self.bannerView2.addSubview(buttonBanner2)
        
        self.stackView.addArrangedSubview(bannerView3)
        bannerView3.setData(title: Constants.txtForBanner3,
                           image: Images.HRProcesses.man4!,
                           backgroundColor: Colors.widgetBlue)
        self.bannerView3.addSubview(buttonBanner3)
        
        self.stackView.addArrangedSubview(bannerView4)
        bannerView4.setData(title: Constants.txtForBanner4,
                           image: Images.HRProcesses.man4!,
                           backgroundColor: Colors.widgetGreen)
        self.bannerView4.addSubview(buttonBanner4)
    }
    @objc func pressButtons(sender: UIButton) {
        switch sender {
        case buttonBanner1:
            if let urlOpen = URL(string: Constants.LinksForButtons.linkBanner1){
                UIApplication.shared.open(urlOpen, options: [:]){ (done) in
                }
            }
        case buttonBanner2:
            if let urlOpen = URL(string: Constants.LinksForButtons.linkBanner2){
                UIApplication.shared.open(urlOpen, options: [:]){ (done) in
                }
            }
        case buttonBanner3:
            if let urlOpen = URL(string: Constants.LinksForButtons.linkBanner3){
                UIApplication.shared.open(urlOpen, options: [:]){ (done) in
                }
            }
        case buttonBanner4:
            if let urlOpen = URL(string: Constants.LinksForButtons.linkBanner4){
                UIApplication.shared.open(urlOpen, options: [:]){ (done) in
                }
            }
        default:
            break
        }
    }
}
//MARK: - Setup Constraints
extension PersonnelReserveViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.Offset.scrollViewTop),
            myScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Offset.leftOffset),
            myScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(Constants.Offset.leftOffset)),
            myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.Offset.leftOffset),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(Constants.Offset.leftOffset)),
            
            bannerView1.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            bannerView1.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            bannerView1.heightAnchor.constraint(equalToConstant: Constants.Offset.banner1ViewHeight),
            
            buttonBanner1.topAnchor.constraint(equalTo: bannerView1.topAnchor),
            buttonBanner1.leftAnchor.constraint(equalTo: bannerView1.leftAnchor),
            buttonBanner1.rightAnchor.constraint(equalTo: bannerView1.rightAnchor),
            buttonBanner1.bottomAnchor.constraint(equalTo: bannerView1.bottomAnchor),
            
            textLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            textLabel.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            
            bannerView2.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            bannerView2.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            bannerView2.heightAnchor.constraint(equalToConstant: Constants.Offset.bannerSize),
            
            buttonBanner2.topAnchor.constraint(equalTo: bannerView2.topAnchor),
            buttonBanner2.leftAnchor.constraint(equalTo: bannerView2.leftAnchor),
            buttonBanner2.rightAnchor.constraint(equalTo: bannerView2.rightAnchor),
            buttonBanner2.bottomAnchor.constraint(equalTo: bannerView2.bottomAnchor),

            bannerView3.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            bannerView3.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            bannerView3.heightAnchor.constraint(equalToConstant: Constants.Offset.bannerSize),
            
            buttonBanner3.topAnchor.constraint(equalTo: bannerView3.topAnchor),
            buttonBanner3.leftAnchor.constraint(equalTo: bannerView3.leftAnchor),
            buttonBanner3.rightAnchor.constraint(equalTo: bannerView3.rightAnchor),
            buttonBanner3.bottomAnchor.constraint(equalTo: bannerView3.bottomAnchor),

            bannerView4.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            bannerView4.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            bannerView4.heightAnchor.constraint(equalToConstant: Constants.Offset.bannerSize),
            
            buttonBanner4.topAnchor.constraint(equalTo: bannerView4.topAnchor),
            buttonBanner4.leftAnchor.constraint(equalTo: bannerView4.leftAnchor),
            buttonBanner4.rightAnchor.constraint(equalTo: bannerView4.rightAnchor),
            buttonBanner4.bottomAnchor.constraint(equalTo: bannerView4.bottomAnchor),
        ])
    }
}
