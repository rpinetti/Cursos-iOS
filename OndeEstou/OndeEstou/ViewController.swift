//
//  ViewController.swift
//  OndeEstou
//
//  Created by Roberto Martinelli Pinetti on 27/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var velocidadeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var enderecoLabel: UILabel!
    
    
    @IBOutlet weak var mapa: MKMapView!
    
    var locationManager = CLLocationManager( );
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.requestWhenInUseAuthorization();
        self.locationManager.startUpdatingLocation();
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Recupera as coordenadas do GPS
        let localizacaoUsuario = locations.last!;
        let latitude = localizacaoUsuario.coordinate.latitude;
        let longitude = localizacaoUsuario.coordinate.longitude;
        
        // Preenche os campos da tela
        self.latitudeLabel.text = String(latitude);
        self.longitudeLabel.text = String(longitude);
        if (localizacaoUsuario.speed > 0) {
            self.velocidadeLabel.text = String(localizacaoUsuario.speed);
        } else {
            self.velocidadeLabel.text = String(0.0);
        }
        
        // Atualiza o mapa
        let deltaLatitude: CLLocationDegrees = 0.01;
        let deltaLongitude: CLLocationDegrees = 0.01;
        
        let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude);
        let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude);
        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacao);
        self.mapa.setRegion(regiao, animated: true);
        
        // Recupera o endereço
        CLGeocoder().reverseGeocodeLocation(localizacaoUsuario, completionHandler: { (detalhes, erro) in
            
            var endereco: String = "";
            
            if ( erro == nil ) {
                
                if let dadosLocal = detalhes?.first {
                
                    var thoroughfare = "";
                    if (dadosLocal.thoroughfare != nil) {
                        thoroughfare = dadosLocal.thoroughfare!;
                    }
                    
                    var subThoroughfare = "";
                    if (dadosLocal.subThoroughfare != nil) {
                        subThoroughfare = dadosLocal.subThoroughfare!;
                    }
                    
                    var locality = "";
                    if (dadosLocal.locality != nil) {
                        locality = dadosLocal.locality!;
                    }
                    
                    var subLocality = "";
                    if (dadosLocal.subLocality != nil) {
                        subLocality = dadosLocal.subLocality!;
                    }
                    
                    var postalCode = "";
                    if (dadosLocal.postalCode != nil) {
                        postalCode = dadosLocal.postalCode!;
                    }
                    
                    var country = "";
                    if (dadosLocal.country != nil) {
                        country = dadosLocal.country!;
                    }
                    
                    var administrativeArea = "";
                    if (dadosLocal.administrativeArea != nil) {
                        administrativeArea = dadosLocal.administrativeArea!;
                    }
                    
                    var subAdministrativeArea = "";
                    if (dadosLocal.subAdministrativeArea != nil) {
                        subAdministrativeArea = dadosLocal.subAdministrativeArea!;
                    }
                    
                    print( "\n / thoroughfare: " + thoroughfare +
                        "\n / subThoroughfare: " + subThoroughfare +
                        "\n / locality: " + locality +
                        "\n / subLocality: " + subLocality +
                        "\n / postalCode: " + postalCode +
                        "\n / country: " + country +
                        "\n / administrativeArea: " + administrativeArea +
                        "\n / subAdministrativeArea: " + subAdministrativeArea
                        );
                    
                    endereco = thoroughfare + ", " + subThoroughfare + " - " + locality + " - " + administrativeArea;
                    
                } else {
                    endereco = "Rua desconhecida";
                }
                
            } else {
                endereco = "Rua desconhecida";
            }
            
            self.enderecoLabel.text = endereco;
            
        });
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status != .authorizedWhenInUse && status != .authorizedAlways {
            
            let alertaController = UIAlertController(title: "Permissão de localização", message: "Necessário permissão da sua localização!!", preferredStyle: .alert);
            
            let acaoConfiguracoes = UIAlertAction(title: "Abrir Configurações", style: .default, handler: { (alertaConfiguracoes) in
                if let configuracoes = NSURL(string: UIApplication.openSettingsURLString ) {
                    UIApplication.shared.open(configuracoes as URL);
                }
            });
            let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil);
            
            alertaController.addAction(acaoConfiguracoes);
            alertaController.addAction(acaoCancelar);
            
            present( alertaController, animated: true, completion: nil );
            
        }   // if status != .authorizedWhenInUse
        
    }
    
    
}

