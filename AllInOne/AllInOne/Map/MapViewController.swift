//
//  MapViewController.swift
//  AllInOne
//
//  Created by Kuan-Wei Lin on 12/23/17.
//  Copyright © 2017 cracktheterm. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationService = LocationService()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isTranslucent = false
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        navigationItem.title = "Map";
        
        if UIApplication.shared.canOpenURL(URL(string: "line://")!) {
            print("User has LINE App")
        }
        else
        {
            print("User doesn't have LINE App")
        }
        
        createLocationService()
    }
    
    func createLocationService()
    {
        locationService.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        mapView.showsBuildings = true
        mapView.showsPointsOfInterest = true
    }
    
    @IBAction func showUserLocation(_ sender: UIButton) {
        print("show user location")
        
        let userLocation: MKUserLocation = mapView.userLocation
        var region = MKCoordinateRegion()
        region.center = userLocation.coordinate
        region = MKCoordinateRegionMakeWithDistance(region.center, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
    }
    
}

extension MapViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        print("regionWillChangeAnimated")
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("mapViewWillStartLoadingMap")
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("mapViewDidFinishLoadingMap")
    }
    
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("mapViewDidFailLoadingMap")
    }
    
    func mapViewWillStartRenderingMap(_ mapView: MKMapView) {
        print("mapViewWillStartRenderingMap")
    }
    
    func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        print("mapViewDidFinishRenderingMap")
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("mapViewWillStartLocatingUser")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        print("mapViewDidStopLocatingUser")
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("didUpdate")
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        print("didChange")
    }
}
