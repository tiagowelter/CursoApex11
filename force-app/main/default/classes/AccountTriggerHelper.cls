public without sharing class AccountTriggerHelper {
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
            taskObj.Subject = 'Verificar dados das contas';
            taskObj.ActivityDate = System.today();
            taskObj.WhatId = vTemp.Id;
            taskList.add(taskObj);
        }
        system.debug(taskList);
        insert taskList;
    }
}
