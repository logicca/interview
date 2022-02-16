public with sharing class ffApex {
        @AuraEnabled(Cacheable=true)
        public static List<Object> ffApexmethod() {
            //map<string,string> movielist;
            List <Object> movielist;
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:ffGradient');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            //system.debug('result1');
            if(response.getStatusCode() != 200) {
                System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
            }
            // If the request is successful, parse the JSON response.
            if(response.getStatusCode() == 200) {
                system.debug('result'+response.getStatusCode());
                 Map<String, Object> result = (Map<String,Object>) JSON.deserializeUntyped(response.getBody());
                 movielist = (List<Object>) result.get('movies');
                }
                return movielist;
            }
}
