@isTest
public class CarroTest {

    @isTest
    static void testAcelerarFunciona(){
        Carro carro1 = new Carro();
        carro1.modelo = 'teste';
        carro1.cor = 'teste';
        carro1.velocidade = 10;
        carro1.ligado = true;
        carro1.temGasolina = true;
        carro1.portaFechada = true;
        Boolean acelerou = carro1.acelerar(10);
        system.debug('acelerou? '+ acelerou);
        System.assertEquals(true, acelerou);
    }

    @isTest 
    static void testAcelerarNaoFunciona(){
        Carro carro1 = new Carro();
        carro1.modelo = 'teste';
        carro1.cor = 'teste';
        carro1.velocidade = 2;
        carro1.ligado = false;
        carro1.temGasolina = false;
        carro1.portaFechada = true;
        Boolean acelerou = carro1.acelerar(10);
        System.assertEquals(false, acelerou);
    }
    
}
