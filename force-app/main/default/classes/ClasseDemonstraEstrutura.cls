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
    public static List<Opportunity> getOpportunities1(){
        List<Opportunity> opportunitiesList = new List<Opportunity>();

        opportunitiesList = [SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won'];
        
        return opportunitiesList;
    }

    public static List<Opportunity> getOpportunities2(){
        return [SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won'];
    }

    public static List<Opportunity> getOpportunities3(){
        List<Opportunity> opportunitiesList = new List<Opportunity>([SELECT Id, Name FROM Opportunity WHERE StageName = 'Closed Won']);
        return opportunitiesList;
    }

    //Exemplos parametros
    //ClasseDemonstraEstrutura.exemploParametros(1,10);
    public static Integer exemploParametros(Integer pInt, Integer pDiv){
        Integer intTest = (10 + pInt)/pDiv;
        system.debug('O valor de intTest é '+intTest);
        return intTest;
    }

    //ClasseDemonstraEstrutura.exemploParametros2([SELECT Id, Name FROM Account]);
    public static void exemploParametros2(List<Account> accountsList){
        system.debug('A lista recebida no parâmetro é: '+ accountsList);
    }
    
    //DESAFIO - Criar um método que recebe um nome de uma pessoa, e a idade, e escreva num syste.debug 'Olá NOME, sua idade é X'. Este método não precisa ter retorno.
    //ClasseDemonstraEstrutura.helloName('José', 45);
    public static void helloName(String nome, Integer idade){
        system.debug('Olá '+nome+' , sua idade é '+idade);
    }

    private static String helloName2(String nome, Integer idade){
        return 'Olá '+nome+' , sua idade é '+idade;
    }

    //Chamada de outros métodos
    public static void callMethods(){
        system.debug(ClasseDemonstraEstrutura.helloName2('Pedro',250));
    }

    //Estrutura de controle
    public static Boolean demostraEstruturaCondicao(Integer idade){
        Boolean maiordeIdade;
        //quero retornar true se a pessoa for maior de idade, senão retorna fase
        if(idade >= 18){
            //aqui entra se for maior de idade
            maiordeIdade = true;
        }else{
            //senão satisfazer a condição acima entra no else
            maiordeIdade = false;
        }
        return maiordeIdade;
    }

    //condição ternária
    public static Boolean demostraEstruturaCondicao2(Integer idade){
        //IF(StageName = 'AAA' , true, false)
        return idade >= 18 ? true : false;
    }

    //condição ternária
    ///NAO É UMA BOA PRATICA
    public static Boolean demostraEstruturaCondicao3(Integer idade){
        Boolean maiorDeIdade;
        if(idade > 18)
            maiorDeIdade = true;
        else
            maiorDeIdade = false;

        return maiorDeIdade;
    }    

    //condições com if else
    //Esta classe vai receber uma idade e dizer se a pessoa é criança, adolescente ou adulto
    //Menor que 13 é criança
    //maior ou igual a 13 e menor ou igual a 21 é adolescente
    //se for maior que 21 e menor que 65 é adulto
    //senão idoso
    // se a idade for nula ou menor que zero deve-se dizer que a idade é inválida
    public static void comparaIdades(Integer idade){
        if(idade == null || idade < 0){
            system.debug('idade inválida');
        }else{
            if(idade < 13){
                system.debug('criança');
            }else if(idade >= 13 && idade <= 21){
                system.debug('adolescente');
            }else if(idade > 21 && idade < 65){
                system.debug('adulto');
            }else{
                system.debug('idoso');
            }
        }
    }

    public static void comparaIdades2(Integer idade){
        if(idade >= 0 && idade < 13){
            system.debug('criança');
        }else if(idade >= 13 && idade <= 21){
            system.debug('adolescente');
        }else if(idade > 21 && idade < 65){
            system.debug('adulto');
        }else if(idade == null || idade < 0){
                system.debug('idade inválida');
        }else{
            system.debug('idoso');
        }
    }   
    
    //Consições com switch
    public static void comparaIdadesSwitch(Integer idade){
        switch on idade{
            when 13{
                system.debug('criança');
            }
            when 22{
                system.debug('adolescente');
            }
            when 61{
                system.debug('adulto');
            }
            when null{
                system.debug('idade inválida');
            }
            when else{
                system.debug('idoso');
            }
        }
    }

    //DESAFIO
    //Construir um método que recebe dois parâmetros do tipo Inteiro e retorne a soma destes dois parâmetros
    //se o parâmetro 1 for maior do que 5 deve somar mais dois neste resultado
    //retornar um inteiro com a soma
    public static Integer somaDoisValoresComIf(Integer p1, Integer p2){
        Integer resultadoSoma = p1 + p2;
        if(p1 > 5){
            //resultadoSoma = resultadoSoma + 2;
            resultadoSoma += 2;
            //system.debug(' resultadoSoma no debug '+resultadoSoma+2);
        }
        system.debug('resultadoSoma '+ resultadoSoma);
        return resultadoSoma;
    }

    public static Integer somaDoisValoresComIf2(Integer p1, Integer p2 ){
        return (p1 > 5) ? (p1 + p2 + 2) : (p1 + p2);
    }
    
    public static Integer somaDoisValoresComIf3(Integer p1, Integer p2 ){
        return p1 + p2 + (p1 > 5 ? 2 : 0);
    }

    //estruturas de repetição
    //Classe que retorne o valor das oportunidades fechadas e ganhas
    public static Decimal getOpportunitiesTotal(){
        Decimal total = 0;
        List<Opportunity> opportunitiesList = new List<Opportunity>([SELECT Amount, Name FROM Opportunity WHERE StageName = 'Closed Won']);
        
        //Opportunity vTemp = new Opportunity();
        for(Opportunity vTemp : opportunitiesList){
            total = total + vTemp.Amount;
            system.debug('Valor da oportunidade ' + vTemp.Name + ' : ' + vTemp.Amount);
        }

        return total;
    }

    public static Decimal getOpportunitiesTotal2(){
        Decimal total = 0;

        if(Schema.sObjectType.Opportunity.isAccessible()){
            for(Opportunity vTemp : [SELECT Amount, Name FROM Opportunity WHERE StageName = 'Closed Won']){
                total = total + vTemp.Amount;
            }
        }

        return total;
    }

    //DESAFIO
    //Metodo que recebe um nome nome de fase e retorne o valor total desta fase nas oportunidades
    public static Decimal getOpportunitiesTotalStageName(String stageNameVARIAVEL){
        Decimal total = 0;
        for(Opportunity vTemp : [SELECT Amount FROM Opportunity WHERE StageName = :stageNameVARIAVEL]){
            total += vTemp.Amount;
        }
        return total;
    }

    //EXECUÇÃO DML - insert - update - delete - upsert
    //insert - insere
    //update - atualiza
    //delete - deleta
    //upsert - insere ou atualiza
    public static Account createAccount(String nameParametro){
        Account accountObj = new Account();
        accountObj.Name = nameParametro;
        insert accountObj;
        return accountObj;
    }

    public static Account updateAccount(String nomeAtualizado, String idaDaConta){

        List<Account> accountList = new List<Account>([SELECT Id, Name FROM Account WHERE Id = :idaDaConta LIMIT 1]);//primeiro buscamos as informações pelo parâmetro de ID

        Account accountObj = new Account();
        if(accountList.size() > 0){
            accountObj = accountList.get(0);//depois pegamos a unica linha que retorna e colocamos no objeto Account
            accountObj.Name = nomeAtualizado;
            update accountObj;
        }

        return accountObj;
    }

    public static void deleteAccount(String idaDaConta){
        List<Account> accountList =  new List<Account>([SELECT Id FROM Account WHERE Id = :idaDaConta]);
        delete accountList;
    }

    public static void deleteAccount2(String idaDaConta){
        delete [SELECT Id FROM Account WHERE Id = :idaDaConta];
    }

    //DESAFIO - Receber o sobrenome, email e nome da empresa e vamos inserir um lead. Se o email do lead já existir deve-se atualizar as informações, senão seve-se inserir. O método deve retornar o lead que foi atualizado/inserido
    public static Lead insertUpdateLead(String sobrenome, String email, String nomeEmpresa){
        Lead leadObj = new Lead();

        List<Lead> leadList = new List<Lead>([SELECT Id, Email, LastName, Company FROM Lead WHERE Email = :email]);

        try{
            if(leadList.size() > 0){
                leadObj = leadList.get(0);
                leadObj.LastName = sobrenome;
                leadObj.Company = nomeEmpresa;
                update leadObj;
            }else{
                leadObj.Email = email;
                leadObj.Company = nomeEmpresa;
                leadObj.LastName = sobrenome;
                insert leadObj;
            }
        }catch(Exception e){
            system.debug(e.getMessage());
        }

        return leadObj;
    }

    //FOR com repetição sem coleção
    //Temos que receber um valor e atraves desse valor mostrar o texto : Texto 1, Texto 2, e assim por diante
    public static void mostraTextos(Integer numberText){
        for(Integer iTemp = 1; iTemp <= numberText; iTemp++ ){
            system.debug('Texto '+iTemp);
        }
    }

    //DESAFIO - 10 contas. Criar 10 contas com o nome 'Conta 1', 'Conta 2', e assim por diante. Não retornar nada
    public static void createAccounts(){
        for(Integer i = 1 ; i <= 10; i++){
            Account accountObj = new Account();
            accountObj.Name = 'Conta '+i;
            insert accountObj;
        }
    }

    public static void createAccountCorrect(){
        List<Account> accountList = new List<Account>();
        for(Integer i; i <= 10; i++){
            Account accountObj = new Account();
            accountObj.Name = 'Conta '+i;
            accountList.add(accountObj);
        }
        insert accountList;
    }

    public static void createAccounts2(Integer valorInserir){
        for(Integer i = 1 ; i <= valorInserir; i++){
            Account accountObj = new Account();
            accountObj.Name = 'Conta '+i;
            insert accountObj;
        }
    }

    //MAP - 
    public static void mapClass1(){
        List<String> stringList =  new List<String>();
        stringList.add('X3');
        stringList.add('X4');
        stringList.add('X2');
        stringList.add('X1');

        Integer position = 1;
        for(String sTemp : stringList){
            if(sTemp == 'X2'){
                system.debug('O X2 esta na posição '+position);
            }
            position++;
        }

        //primeiro a chave e depois a coleção
        Map<String, Integer> stringMap = new Map<String, Integer>();
        stringMap.put('X3',0);
        stringMap.put('X4',1);
        stringMap.put('X2',2);
        stringMap.put('X1',3);
        system.debug('Contem a chave? '+stringMap.containsKey('X2'));
    }

    //
    public static void veriFyLeadErrodo(){
        for(Integer i; i < 10; i++){
            String companyName = 'Company '+i;
            List<Lead> leadList = new List<Lead>([SELECT Company FROM Lead WHERE Company = :companyName]);

            if(leadList.size() == 0){
                Lead leadObj = new Lead();
                leadObj.LastName = 'LastName '+i;
                leadObj.Company = companyName;  
                insert leadObj;
            }
        }
    }

    public static void veriFyLeadCoreto(){
        Map<String, Lead> leadMap = new Map<String,Lead>();
        for(Lead vTemp : [SELECT Id, Company, LastName FROM Lead]){
            leadMap.put(vTemp.Company, vTemp);
        }

        List<Lead> leadList = new List<Lead>();
        for(Integer i; i < 10; i++){
            String companyName = 'Company '+i;

            if(!leadMap.containsKey(companyName)){
                Lead leadObj = new Lead();
                leadObj.LastName = 'LastName '+i;
                leadObj.Company = companyName; 
                leadList.add(leadObj);
            }else{
                Lead leadObj = leadMap.get(companyName);
                system.debug('O lead já existe com o sobrenome'+ leadObj.LastName);
            }
        }
        insert leadList;
    }

    //DESAFIO - 

}//Fim do corpo do classe