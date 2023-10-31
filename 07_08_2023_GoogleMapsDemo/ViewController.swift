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
        googleMapView.delegate = self
        initializationOfGoogleMapView()
        setttingUpCameraPosition(position: punePosition)
        showMarker(position: punePosition)
        drawPolyline()
        drawCircle(position: punePosition)
        drawPolygon()
        
//        GMSCameraUpdate.setTarget(
//            punePosition,
//            zoom: 30.0)
        
    }
    
    func setttingUpCameraPosition(position : CLLocationCoordinate2D){
        
        cameraPosition = GMSCameraPosition(
            latitude:position.latitude,
            longitude: position.longitude,
            zoom: 5.0)
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
        marker.title = "Pune"
        marker.map = googleMapView
        marker.snippet = "Marker Pune"
        marker.position = position
    }
    
    func drawPolygon(){
        let gmsMutablePolygonPath = GMSMutablePath()
        gmsMutablePolygonPath.add(CLLocationCoordinate2D(latitude: 26.90, longitude: 75.73))
        gmsMutablePolygonPath.add(CLLocationCoordinate2D(latitude: 24.87, longitude: 74.62))
        gmsMutablePolygonPath.add(CLLocationCoordinate2D(latitude: 12.12, longitude: 76.68))
        gmsMutablePolygonPath.add(CLLocationCoordinate2D(latitude: 16.99, longitude: 73.30))
        
        let polygonPath = GMSPolygon(path: gmsMutablePolygonPath)
        polygonPath.strokeWidth = 5.0
        polygonPath.strokeColor = .brown
        polygonPath.fillColor = UIColor(red: 50.0, green: 0.0, blue: 50.0, alpha: 3.0)
        polygonPath.map = googleMapView
    }
    
    func drawPolyline(){
        let gmsMutablePolylinePath = GMSMutablePath()
        gmsMutablePolylinePath.add(CLLocationCoordinate2D(latitude: 19.07, longitude: 72.87))
        gmsMutablePolylinePath.add(CLLocationCoordinate2D(latitude: 19.87, longitude: 75.34))
        gmsMutablePolylinePath.add(CLLocationCoordinate2D(latitude: 19.14, longitude: 77.31))
        gmsMutablePolylinePath.add(CLLocationCoordinate2D(latitude: 18.52, longitude: 73.85))
        gmsMutablePolylinePath.add(CLLocationCoordinate2D(latitude: 19.07, longitude: 72.87))
        
        let gmsPolylinePath = GMSPolyline(path: gmsMutablePolylinePath)
        gmsPolylinePath.strokeColor = .black
        gmsPolylinePath.strokeWidth = 20.0
        gmsPolylinePath.map = googleMapView
        gmsPolylinePath.title = "Polyline"
    }
    
    func drawCircle(position : CLLocationCoordinate2D){
    
        let circle = GMSCircle(
            position: position,
            radius: 1000.0)
        circle.title = "bitcode"
        circle.fillColor = .lightGray
        circle.strokeColor = .magenta
        circle.strokeWidth = 4.0
        circle.map = googleMapView
    }
}

extension ViewController : GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let infoWindow = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 160))
        //infoWindow.backgroundColor = .cyan
        let name = UILabel(frame: CGRect(
            x: 40,
            y: 40,
            width: Int(infoWindow.frame.width) - 40,
            height: 40))
        name.text = "Bitcode"
        name.textColor = .black
        name.backgroundColor = UIColor(red: 50.0, green: 0.0, blue: 50.0, alpha: 0.4)
        infoWindow.addSubview(name)
        
        let city = UILabel(frame: CGRect(
            x: 40,
            y: 100,
            width: Int(name.frame.width),
            height: 40))
        city.text = "Pune"
        city.textColor = .black
        city.backgroundColor = UIColor(red: 50.0, green: 0.0, blue: 50.0, alpha: 0.4)
        infoWindow.addSubview(city)
        
        return infoWindow
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print(marker.position)
    }
    
    func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
        print(marker.position)
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print(marker.position)
    }
    
    func mapView(_ mapView: GMSMapView, didTapMyLocation location: CLLocationCoordinate2D) {
        print(location)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging \(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag \(marker.position)")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging \(marker.position)")
    }
}
