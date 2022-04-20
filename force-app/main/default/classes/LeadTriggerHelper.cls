public without sharing class LeadTriggerHelper {
    public void createLeadTask(List<Lead> leadList){
        List<Task> taskList =  new List<Task>();
        String nameTask = 'Primeiro contato com o lead';

        Set<Id> idsSet = new Set<Id>();
        for(Lead vTemp : leadList){
            idsSet.add(vTemp.Id);
        }

        Map<Id, Task> taskMap = new Map<Id, Task>();
        for(Task vTemp : [SELECT WhoId, Subject FROM Task WHERE Subject = :nameTask AND WhoId IN :idsSet]){
            taskMap.put(vTemp.WhoId, vTemp);
        }

        for(Lead vTemp : leadList){
            //Aqui eu crio uma tarefa e vinculo  a cada lead
            if(!taskMap.containsKey(vTemp.Id)){
                Task taskObj = new Task();
                taskObj.Subject = nameTask;
                taskObj.ActivityDate = System.today();
                taskObj.WhoId = vTemp.Id;
                taskList.add(taskObj);
            }
        }
        insert taskList;
    }
}
