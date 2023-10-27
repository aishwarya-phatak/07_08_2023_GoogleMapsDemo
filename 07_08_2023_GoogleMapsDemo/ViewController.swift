//
//  ViewController.swift
//  07_08_2023_GoogleMapsDemo
//
//  Created by Vishal Jagtap on 27/10/23.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    @IBOutlet weak var googleMapView: GMSMapView!
    var marker : GMSMarker = GMSMarker()
    var dapoliPosition : CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: 17.7527,longitude: 73.1898)
    var punePosition : CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: 18.5204,
        longitude: 73.8567)
    var cameraPosition : GMSCameraPosition?

    override func viewDidLoad() {
        super.viewDidLoad()
        initializationOfGoogleMapView()
        showMarker(position: punePosition)
        setttingUpCameraPosition(position: punePosition)
//        GMSCameraUpdate.setTarget(
//            punePosition,
//            zoom: 30.0)
    }
    func setttingUpCameraPosition(position : CLLocationCoordinate2D){
        
        cameraPosition = GMSCameraPosition(
            latitude:position.latitude,
            longitude: position.longitude,
            zoom: 30.0)
        googleMapView.camera = cameraPosition!
    }
    
    func initializationOfGoogleMapView(){
        googleMapView.settings.myLocationButton = true
        googleMapView.settings.rotateGestures = true
        googleMapView.settings.scrollGestures  = true
        googleMapView.settings.tiltGestures = true
        googleMapView.settings.zoomGestures = true
        googleMapView.settings.setAllGesturesEnabled(true)
        googleMapView.isTrafficEnabled = true
        googleMapView.isBuildingsEnabled = true
        googleMapView.isMyLocationEnabled = true
        googleMapView.mapType = GMSMapViewType.normal
    }
    
    func showMarker(position : CLLocationCoordinate2D){
        marker.rotation = 30.0
        marker.zIndex = 10
        marker.isDraggable = true
        marker.title = "Bitcode"
        marker.map = googleMapView
        marker.snippet = "Marker Bitcode"
        marker.position = position
    }
}
