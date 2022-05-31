public with sharing class CaseController {
    @AuraEnabled
    public static Case addCase(String accountId, String caseName, String caseDate, String caseDescription){

        Case caseObj = new Case();
        caseObj.Subject = caseName;
        caseObj.AccountId = accountId;
        caseObj.Description = caseDescription;
        caseObj.Status = 'New';
        insert caseObj;

        return caseObj;
    }
}
