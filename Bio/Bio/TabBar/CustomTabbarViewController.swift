//
//  CustomTabbarViewController.swift
//  Bio
//
//  Created by BMK on 13.02.2025.
//

import UIKit

class CustomTabbarViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet var bottomTabView: UIView?
    
    @IBOutlet var selectedStateViews: [UIView]!
    
    var main: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomTabView?.layer.cornerRadius = (bottomTabView?.frame.size.height ?? 0.0) / 2.0
        handleSelectedViews(current: 0)
        let controller = main.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self))
        addChild(controller)
        containerView?.addSubview(controller.view)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        controller.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tabTapped(_ sender: UIButton) {
        let tag = sender.tag
        handleSelectedViews(current: tag)
        
        if tag == 0{
            let controller = main.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self))
            addChild(controller)
            containerView?.addSubview(controller.view)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        }
        else if tag == 1{
            let controller = main.instantiateViewController(withIdentifier: String(describing: InterestsHobbiesViewController.self))
            addChild(controller)
            containerView?.addSubview(controller.view)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        }
        else if tag == 2{
            let controller = main.instantiateViewController(withIdentifier: String(describing: GoalsDreamsViewController.self))
            addChild(controller)
            containerView?.addSubview(controller.view)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
            controller.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            controller.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            controller.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            controller.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        }
    }
    
    
    
    func handleSelectedViews(current state: Int) {
        selectedStateViews.forEach { selectedView in
            print(selectedView.tag)
            selectedView.isHidden = (selectedView.tag != state)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
