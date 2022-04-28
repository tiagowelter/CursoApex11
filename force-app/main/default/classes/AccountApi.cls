@RestResource(urlMapping = '/AulaDeApex/Accounts/*')

global with sharing class AccountApi {

    @HttpGet
    global static List<Account> getAccounts(){
        List<Account> accountList = new List<Account>();

        String nomeConta = RestContext.request.params.get('nome');

        if(String.IsnotBlank(nomeConta)){
            String likeVelue = '%'+nomeConta+'%';
            accountList = [SELECT Id, Name FROM Account WHERE Name LIKE :likeVelue];
        }else{
            accountList = [SELECT Id, Name FROM Account];
        }

        return accountList;
    }

    /*
    Body de chamada do metodo createAccount:
    {
        "accountList" : [
            {
                    "Name" : "Teste Api 1",
                    "Phone" : "999555"
            },
            {
                    "Name" : "Teste Api 2",
                    "Phone" : "999555"
            }      
        ]
    }
    */
    @HttpPost
    global static List<Account> createAccount(List<Account> accountList){
        List<Account> insertList = new List<Account>();

        for(Account cTemp :accountList){
            Account accountObj = new Account();
            accountObj.Name = cTemp.Name;
            accountObj.Phone = cTemp.Phone;
            insertList.add(accountObj);
        }
        insert insertList;

        return insertList;
    }
    
}
