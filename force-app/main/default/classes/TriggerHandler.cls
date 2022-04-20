public interface TriggerHandler {
    void beforeInsert(List<sObject> newRecords);
    void beforeUpdate(List<sObject> oldRecords, List<sObject> newRecords, Map<Id,sObject> oldRecordMap, Map<Id, sObject> newRecordMap);
    //void afterUpdate(List<sObject> oldRecords, List<sObject> newRecords, Map<Id, sObject> oldRecordMap, Map<Id, sObject> newRecordMap);
    void afterInsert(List<sObject> oldRecords, List<sObject> newRecords);
}
