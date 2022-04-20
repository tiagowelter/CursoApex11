public without sharing class AccountTriggerHandler implements TriggerHandler {

    private boolean triggerIsExecuting;
    public AccountTriggerHelper helper;

    public AccountTriggerHandler(boolean triggerIsExecuting){
        this.triggerIsExecuting = triggerIsExecuting;
        this.helper = new AccountTriggerHelper();
    }

    public void beforeInsert(List<Account> newAccounts){

        //Aqui executamo o que vai no before insert
        helper.metodoTask1();

    }

    public void afterInsert(List<Account> oldAccounts, List<Account> newAccounts){

        helper.createTaskNewAccounts(newAccounts);

    }    

    public void beforeUpdate(List<Account> oldAccounts, List<Account> newAccounts, Map<Id, sObject> oldAccountsMap, Map<Id, sObject> newAccountMap){

        //Aqui executamo o que vai no before insert

    }

}
