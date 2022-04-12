//nome da classe
public with sharing class ClasseDemonstraEstrutura {

    //Aqui temos um método
    public static void acelerar(){
        //Aqui fica o corpo do método
    }//Fim do método acelerar

    //1 private ou publico - nivel de acesso ao método
    //2 - static
    //3 - tipo de retorno do metodo
    //ClasseDemonstraEstrutura.nomeDoMetodo();
    public static boolean nomeDoMetodo(){//inicio do metodo nomeDoMetodo

        //SALVAR CTRL + S

        //1 - TIPO DA VARIAVEL | 2 - NOME DA VARIAVEL | 3 - VALOR DA VARIAVEL
        Boolean bBool = true;
        Boolean bBool2 = false;
        Boolean bBool3;
        String exemploDeString = 'texto 123087';
        Integer exemploDeInteger = 1;
        Decimal exemploDeDecimal = 20.05;
        Double exemploDeDouble = 1.5545456566;

        String exemploString2 = 'text 12354';

        //coleções
        List<String> exemploList = new List<String>();
        // 0 - Cris
        // 1 - Paulo
        // 2 - Vanderlan
        // 3 - João 
        exemploList.add('Cris');
        exemploList.add('Paulo');
        exemploList.add('Vanderlan');
        exemploList.add('João');
        system.debug('estou escrevendo os valores da lista exemploList :' + exemploList);
        system.debug('Na posicao  3 esta escrito: '+exemploList.get(3));

        List<Integer> integerList = new List<Integer>();
        integerList.add(null); //posicao 0
        integerList.add(3);//posicao 1
        integerList.add(5);//posicao 2
        system.debug(integerList.get(2));

        return bBool;//Aqui esta o retorno do metodo que é o mesmo tipo do que definimos na declaração do método

    }//fim do metodo nomeDoMetodo
    
}//Fim do corpo do classe
