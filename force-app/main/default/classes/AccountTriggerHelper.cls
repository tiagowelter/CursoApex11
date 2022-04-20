public without sharing class AccountTriggerHelper {
    
    public static final String SUBJECT_ACCOUNT_TASK = 'Verificar dados cadastrais das contas';
    
    public AccountTriggerHelper() {

    }
    public void metodoTask1(){

    }

    public void metodoTask2(){
        
    }

    public void createTaskNewAccounts(List<Account> accountList){
        List<Task> taskList = new List<Task>();
        for(Account vTemp : accountList){
            Task taskObj = new Task();
            taskObj.Subject = SUBJECT_ACCOUNT_TASK;
            taskObj.ActivityDate = System.today();
            taskObj.WhatId = vTemp.Id;
            taskList.add(taskObj);
        }
        system.debug(taskList);
        insert taskList;
    }
}
