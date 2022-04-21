public without sharing class LeadTriggerHelper {
    
    public static final String SUBJECT_LEAD_TASK = 'Primeiro contato com o lead';

    @future
    public static void createLeadTask(String leadListString){
        List<Task> taskList =  new List<Task>();

        List<Lead> leadList = (List<Lead>) JSON.deserialize(leadListString, List<Lead>.class);

        Set<Id> idsSet = new Set<Id>();
        for(Lead vTemp : leadList){
            idsSet.add(vTemp.Id);
        }

        Map<Id, Task> taskMap = new Map<Id, Task>();
        for(Task vTemp : [SELECT WhoId, Subject FROM Task WHERE Subject = :SUBJECT_LEAD_TASK AND WhoId IN :idsSet]){
            taskMap.put(vTemp.WhoId, vTemp);
        }

        for(Lead vTemp : leadList){
            //Aqui eu crio uma tarefa e vinculo  a cada lead
            if(!taskMap.containsKey(vTemp.Id)){
                Task taskObj = new Task();
                taskObj.Subject = SUBJECT_LEAD_TASK;
                taskObj.ActivityDate = System.today();
                taskObj.WhoId = vTemp.Id;
                taskList.add(taskObj);
            }
        }
        insert taskList;
    }
}
