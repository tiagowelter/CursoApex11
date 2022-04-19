trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {

    //Coleções executadas nas triggers
    //Trigger.New - contem od dados após a alteração
    //Trigger.Old - contem os dados antes da alteração
    if( (Trigger.isInsert || Trigger.isUpdate ) && Trigger.isAfter){
        List<Task> taskList =  new List<Task>();
        String nameTask = 'Primeiro contato com o lead';

        Set<Id> idsSet = new Set<Id>();
        for(Lead vTemp : Trigger.New){
            idsSet.add(vTemp.Id);
        }

        Map<Id, Task> taskMap = new Map<Id, Task>();
        for(Task vTemp : [SELECT WhoId, Subject FROM Task WHERE Subject = :nameTask AND WhoId IN :idsSet]){
            taskMap.put(vTemp.WhoId, vTemp);
        }

        for(Lead vTemp : Trigger.New){
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