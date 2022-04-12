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

        List<String> exemploList2 = new List<String>();
        exemploList2.add('Fabio');
        exemploList2.add('Marcelo');
        exemploList2.add('Marcelo');
        exemploList2.add('David');
        exemploList2.add('David');
        exemploList2.add('David');
        system.debug('Exemplo Lista 2'+exemploList2);

        //O set não mantém registros duplicados na coleção, e ordena os mesmos
        Set<String> setExemplo =  new Set<String>();
        setExemplo.add('Fabio');
        setExemplo.add('Marcelo');
        setExemplo.add('Marcelo');
        setExemplo.add('David');
        setExemplo.add('David');
        setExemplo.add('David');
        system.debug('Exemplo set'+setExemplo);      
        
        Opportunity[] opportunityMatriz = [SELECT Id, Name, Account.Name, Amount, (SELECT Id FROM OpportunityLineItems) FROM Opportunity];
        system.debug('Opportunity na matriz' + opportunityMatriz);
        system.debug('Opportunity na matriz pos 2' + opportunityMatriz[2]);
        
        //Exemplo de SOQL
        List<Opportunity> opportunityList = new List<Opportunity>([SELECT Id, Name, Account.Name, Amount, (SELECT Id, Product2Id FROM OpportunityLineItems) FROM Opportunity]);
        system.debug('Lista de oportunidades' + opportunityList);
        /*
            (
                Opportunity:{Id=0068b00001JbtYiAAJ, Name=Edge Emergency Generator, AccountId=0018b00001xfYYKAA2, Amount=75000.00}
                , Opportunity:{Id=0068b00001JbtYpAAJ, Name=Edge Installation, AccountId=0018b00001xfYYKAA2, Amount=50000.00}
                , Opportunity:{Id=0068b00001JbtYqAAJ, Name=Edge SLA, AccountId=0018b00001xfYYKAA2, Amount=60000.00}
                , Opportunity:{Id=0068b00001JbtZ4AAJ, Name=Edge Emergency Generator, AccountId=0018b00001xfYYKAA2, Amount=35000.00}
            )    
        */
        system.debug('Oportunidade da posição 2 '+opportunityList.get(2));
        system.debug('O nome da oportunidade da posição 2 é : '+opportunityList.get(2).Name);

        return bBool;//Aqui esta o retorno do metodo que é o mesmo tipo do que definimos na declaração do método

    }//fim do metodo nomeDoMetodo

    //Estrutura do SOQL
    //SELECT
    //campos
    //FROM
    //nome do objeto
    //WHERE
    //condição de busca
    public static List<Account> getAccounts(){
        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id != '']);
        return accountList;
    }

    //DESAFIO - Montar um método que busque e retorne uma lista com todas as oportunidades com a fase igual a 'Closed Won'. Campos: Id e Name
    
}//Fim do corpo do classe
