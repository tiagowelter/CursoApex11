@isTest
public class LeadTriggerTest {

    @TestSetup
    static void setup(){
        Lead leadObj = new Lead();
        leadObj.LastName = 'Test';
        leadObj.Company = 'Test';
        insert leadObj;

        Lead leadObj2 = new Lead();
        leadObj2.LastName = 'Test2';
        leadObj2.Company = 'Test2';
        insert leadObj2;        
    }

    @isTest
    static void testCrateLead(){

        Lead leadObj = [SELECT Id, LastName FROM Lead WHERE LastName = 'Test' LIMIT 1];

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhoId = :leadObj.Id AND Subject = :LeadTriggerHelper.SUBJECT_LEAD_TASK ]);

        System.assertEquals(1, taskList.size() );
    }

    @isTest
    static void testUpdateLead(){

        Lead leadObj = [SELECT Id, LastName FROM Lead WHERE LastName = 'Test' LIMIT 1];

        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhoId = :leadObj.Id AND Subject = : LeadTriggerHelper.SUBJECT_LEAD_TASK]);
        delete taskList;

        leadObj.LastName = 'Test Update';
        Test.startTest();
            update leadObj;
        Test.stopTest();        

        taskList = new List<Task>([SELECT Id FROM Task WHERE WhoId = :leadObj.Id AND Subject = : LeadTriggerHelper.SUBJECT_LEAD_TASK]);
        
        System.assertEquals(1, taskList.size());

    }

    @isTest
    static void testBulkLead(){
        Integer qtyLead = 100000;
        List<Lead> leadList = new List<Lead>();
        for(Integer i = 1 ; i <= qtyLead; i++){
            Lead leadObj =  new Lead();
            leadObj.LastName = 'Lead '+i;
            leadObj.Company = 'Lead '+i;
            leadList.add(leadObj);
        }
        Test.startTest();
            insert leadList;
        Test.stopTest();
        List<Task> taskList = new List<Task>([SELECT Id FROM Task WHERE WhoId IN :leadList AND Subject = :LeadTriggerHelper.SUBJECT_LEAD_TASK]);
        System.assertEquals(qtyLead, taskList.size());
    }

}
