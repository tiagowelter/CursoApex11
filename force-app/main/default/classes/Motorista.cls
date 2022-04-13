public with sharing class Motorista {

    public static void carroDoMotorista(){

        Carro carro1 = new Carro();
        carro1.modelo = 'Marea';
        carro1.cor = 'Cinza';
        carro1.velocidade = 0;
        carro1.ligado = true;
        carro1.temGasolina = true;
        carro1.portaFechada = true;
        system.debug('Acelerou o carro 1? '+carro1.acelerar(10));
        system.debug('Carro 1 do motorista = '+carro1);

        Carro carro2 = new Carro();
        carro2.modelo = 'Fusca';
        carro2.cor = 'Preto';
        carro2.velocidade = 0;
        carro2.temGasolina = true;
        carro2.portaFechada = true;
        system.debug('Carro 2 do motorista = '+carro2);
        system.debug('Acelerou o carro 2? '+carro2.acelerar(60));

    }

}
