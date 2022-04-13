public with sharing class Carro {
    
    //Atributos do carro
    public String modelo {get;set;}
    public String cor {get;set;}
    public Integer velocidade {get;set;}
    public Boolean ligado {get;set;}
    public Boolean temGasolina {get;set;}
    public Boolean portaFechada {get;set;}

    public Boolean acelerar(Integer velocidade){
        //DESAFIO - Verificar se o carro tem ou não gasolina. Criar um atributo chamado portaFechada. E se esses atributos não forem atendidos não pode acelerar o carro
        return this.ligado == true && this.temGasolina && this.portaFechada ? true : false;
    }
    
}
