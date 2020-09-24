public with sharing class RestCallout {

    public static Http http = new Http();
    public static HTTPResponse response;
    public static HttpRequest request;

    public static void getAccount(Id accId) {

        request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('callout:SalesforceAccount/services/apexrest/Account/' + accId);

        response = http.send(request);

        System.debug(response.getBody());
    }

    public static void addAccount(String name) {

        request = new HttpRequest();
        request.setMethod('POST');
        request.setEndpoint('callout:SalesforceAccount/services/apexrest/Account');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Account newAccount = new Account(Name = name);
        request.setBody(JSON.serialize(newAccount));

        response = http.send(request);

        System.debug(response.getBody());
    }

    public static void deleteAccount(Id accId) {

        request = new HttpRequest();
        request.setMethod('DELETE');
        request.setEndpoint('callout:SalesforceAccount/services/apexrest/Account/' + accId);

        response = http.send(request);

        System.debug(response.getBody());
    }

    public static void upsertAccount(Id accId, String name) {

        request = new HttpRequest();
        request.setMethod('PUT');
        request.setEndpoint('callout:SalesforceAccount/services/apexrest/Account?id=' + accId +'&name=' + name);

        response = http.send(request);

        System.debug(response.getBody());
    }

    public static void updateAccount(Id accId, String name) {

        request = new HttpRequest();
        request.setMethod('PATCH');
        request.setEndpoint('callout:SalesforceAccount/services/apexrest/Account/' + accId);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        Account updateAccount = new Account(Name = name);
        request.setBody(JSON.serialize(updateAccount));
        response = http.send(request);

        System.debug(response.getBody());
    }

}