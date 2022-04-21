public without sharing class LeadTriggerHandler implements TriggerHandler{
    
    private boolean triggerIsExecuting;
    public LeadTriggerHelper helper;
    public LeadTriggerHandler(boolean triggerIsExecuting) {
        this.triggerIsExecuting = triggerIsExecuting;
        this.helper = new LeadTriggerHelper();
    }

    public void beforeInsert(List<Lead> newLeads){

    }

    public void afterInsert(List<Lead> oldLeads, List<Lead> newLeads){
        LeadTriggerHelper.createLeadTask(JSON.serialize(newLeads));
    }

    public void beforeUpdate(List<Lead> oldLeads, List<Lead> newLeads, Map<Id, sObject> oldLeadsMap, Map<Id, sObject> newLeadMap){

    }

    public void afterUpdate(List<Lead> oldLeads, List<Lead> newLeads, Map<Id, sObject> oldLeadsMap, Map<Id, sObject> newLeadMap){
        LeadTriggerHelper.createLeadTask(JSON.serialize(newLeads));
    }        
}
