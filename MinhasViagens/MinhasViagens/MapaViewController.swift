//
//  ViewController.swift
//  MinhasViagens
//
//  Created by Roberto Martinelli Pinetti on 27/02/19.
//  Copyright © 2019 Curso iOS 12. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapa: MKMapView!;
    private var locationManager = CLLocationManager( );
    var viagem: Dictionary<String, String> = [:];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.viagem == [:] {
            self.configuraGerenciadorLocalizacao();
        } else {
            self.adicionarMarcador(viagem: self.viagem);
        }
        
        self.reconhecerGestos();
        
    }   // func viewDidLoad

    private func configuraGerenciadorLocalizacao( ) {
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.requestWhenInUseAuthorization();
        self.locationManager.startUpdatingLocation();
    }
    
    private func reconhecerGestos( ) {
        
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(MapaViewController.marcar(gesture:) ) );
        reconhecedorGesto.minimumPressDuration = 2;
        
        self.mapa.addGestureRecognizer(reconhecedorGesto);
        
    }   // func reconhecerGestos

    @objc func marcar(gesture: UIGestureRecognizer) {
        
        if (gesture.state == UIGestureRecognizer.State.began) {
            // Recupera o ponto selecionado
            let pontoSelecionado = gesture.location(in: self.mapa);
            let coordenadas = self.mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa);
            
            // Recupera o endereço do ponto selecionado
            let localizacao: CLLocation = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude);
            var localCompleto = "Endereço não encontrado!!!";
            
            CLGeocoder().reverseGeocodeLocation(localizacao) { (local, erro) in

                if ( erro == nil ) {
                    
                    if let dadosLocal = local?.first {
                        
                        if let nome = dadosLocal.name {
                            localCompleto = nome;
                        } else {
                            
                            if let endereco = dadosLocal.thoroughfare {
                                localCompleto = endereco;
                            }
                            
                        }
                        
                    }
                    
                    self.viagem = ["local": localCompleto, "latitude": String(coordenadas.latitude), "longitude": String(coordenadas.longitude) ];
                    ArmazenarDados().gravar(viagem: self.viagem);
                    self.adicionarMarcador(viagem: self.viagem);
                    
                } else {
                    print(erro as! String);
                }
                
                
            }
            
        }
        
    }   // func marcar
    
    private func adicionarMarcador( viagem: Dictionary<String, String> ) {
        
        if let localViagem = viagem["local"] {
            if let latitudeS = viagem["latitude"] {
                if let longitudeS = viagem["longitude"] {
                    
                    if let latitude = Double(latitudeS) {
                        if let longitude = Double(longitudeS) {
                            
                            // Marca o ponto no mapa
                            let anotacao = MKPointAnnotation( );
                            anotacao.coordinate.latitude = latitude;
                            anotacao.coordinate.longitude = longitude;
                            anotacao.title = localViagem;
                            
                            self.mapa.addAnnotation(anotacao);
                            self.posicionarMapa(latitude: latitude, longitude: longitude);
                        }
                    }
                    
                }
            }
        }
        
    }   // func adicionarMarcador
    
    private func posicionarMapa(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let localizacao = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude);
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01);
        let regiao = MKCoordinateRegion.init(center: localizacao, span: span);
        
        self.mapa.setRegion(regiao, animated: true);
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let localizacao = locations.last {
            self.posicionarMapa(latitude: localizacao.coordinate.latitude, longitude: localizacao.coordinate.longitude);
        }
        
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
    
}   // class MapaViewController

