@isTest
public with sharing class GetExternalLeadsTest {

    private class Mock implements HttpCalloutMock{
        public HTTPResponse respond(HttpRequest req){
            HttpResponse response = new HttpResponse();
            response.setHeader('content-type', 'application/json');
            response.setStatusCode(200);
            response.setBody('{"coord":{"lon":-0.1257,"lat":51.5085},"weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],"base":"stations","main":{"temp":293.58,"feels_like":293.14,"temp_min":292.06,"temp_max":294.26,"pressure":1021,"humidity":56},"visibility":10000,"wind":{"speed":6.17,"deg":220},"clouds":{"all":100},"dt":1652117193,"sys":{"type":2,"id":2019646,"country":"GB","sunrise":1652069901,"sunset":1652124935},"timezone":3600,"id":2643743,"name":"London","cod":200}');
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
