@isTest
public with sharing class GetExternalLeadsTest {

    private class Mock implements HttpCalloutMock{
        public HTTPResponse respond(HttpRequest req){
            HttpResponse response = new HttpResponse();
            response.setHeader('content-type', 'application/json');
            response.setStatusCode(200);
            response.setBody('[{"attributes" : {"type" : "Lead","url" : "/services/data/v54.0/sobjects/Lead/00Q8c00000zdfa4EAA"},"Id" : "00Q8c00000zdfa4EAA","LastName" : "Welter","Company" : "Tiwe"}]');
            return response;
        }
    }

    @isTest
    static void testGetData() {

        Test.startTest();
            Test.setMock(HttpCalloutMock.class, new Mock());
            GetExternalLeads.getData();
        Test.stopTest();

        List<Lead> leadList =  new List<Lead>([SELECT Id, Company, LastName FROM Lead]);
        System.assertNotEquals(0, leadList.size());
    }

}
