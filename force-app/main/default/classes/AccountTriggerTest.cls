@isTest
public class AccountTriggerTest {

    //teste 1 - criar uma conta com tarefa
    @isTest
    static void testCreateAccount(){

        Account acccountObj = new Account();
        acccountObj.Name = 'Test';
        acccountObj.Phone = '3333';
        insert acccountObj;

        acccountObj.Phone = '555555';
        update acccountObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhatId = :acccountObj.Id AND Subject = :AccountTriggerHelper.SUBJECT_ACCOUNT_TASK]);
        System.assertEquals(1, taskList.size());

        //delete acccountObj;

    }

    //teste 2 - baseado em uma grande massa de dados
    @isTest
    static void testBulkAccount(){

        Integer qtyAccount = 100;
        List<Account> accountList = new List<Account>();
        
        for(Integer i = 1; i <= qtyAccount; i++){
            Account accountObj =  new Account();
            accountObj.Name = 'Conta '+i;
            accountObj.Phone = '64';
            accountList.add(accountObj);
        }
        insert accountList;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE Subject = :AccountTriggerHelper.SUBJECT_ACCOUNT_TASK AND WhatId IN : accountList]);

        System.assertEquals(qtyAccount, taskList.size());

    }

    //DESAFIO - Cobrir as classes da trigger do lead, fazendo as verificações (System.assertEquals) para garantir que a logica funcione

}
