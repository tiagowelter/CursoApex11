@isTest
public class AccountTriggerTest {

    @isTest
    static void testCreateAccount(){

        Account acccountObj = new Account();
        acccountObj.Name = 'Test';
        insert acccountObj;

        acccountObj.Phone = '555555';
        update acccountObj;

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhatId = :acccountObj.Id AND Subject = :AccountTriggerHelper.SUBJECT_ACCOUNT_TASK]);
        System.assertEquals(1, taskList.size());

        //delete acccountObj;

    }

}
