//
//  ViewController.swift
//  TrabalhandoMapas
//
//  Created by Roberto Martinelli Pinetti on 25/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!
    var locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self;
        // Precisão do GPS
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // Solicita autorização do usuário para utilização da Localização
        self.locationManager.requestWhenInUseAuthorization();
        self.locationManager.startUpdatingLocation();
        
        /*
        let latitude: CLLocationDegrees = -23.586801;
        let longitude: CLLocationDegrees = -46.6598097;
        let deltaLatitude: CLLocationDegrees = 0.007;
        let deltaLongitude: CLLocationDegrees = 0.007;
        
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude);
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude);
        
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao);
        
        self.mapa.setRegion(regiao, animated: true);
        
        let anotacao: MKPointAnnotation = MKPointAnnotation( );
        anotacao.coordinate = localizacao;
        anotacao.title = "Parque do Ibirapuera";
        anotacao.subtitle = "Parque";
        
        self.mapa.addAnnotation(anotacao);
        */
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let localizacaoUsuario: CLLocation = locations.last!;
        
        //Monta a exibição do mapa
        let deltaLatitude: CLLocationDegrees = 0.007;
        let deltaLongitude: CLLocationDegrees = 0.007;
        
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: localizacaoUsuario.coordinate.latitude, longitude: localizacaoUsuario.coordinate.longitude);
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude);
        
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao);
        
        self.mapa.setRegion(regiao, animated: true);
        
    }
    
}

