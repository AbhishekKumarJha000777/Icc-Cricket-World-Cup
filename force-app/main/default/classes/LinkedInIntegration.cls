public class LinkedInIntegration {
    @AuraEnabled
    public static void postToLinkedIn(String Message){
        String loginId = loginInToLinkedIn();
        postMessage(loginId, Message);
    }
    public static String loginInToLinkedIn(){
        Http ht = new Http();
        Httprequest req = new Httprequest();
        req.setMethod('GET');
        req.setEndpoint('callout:LinkedIn_Integrate/v2/userinfo');
        Httpresponse res = ht.send(req);
        //System.debug('response ' + res.getBody());
        //System.debug('response ' + res.getStatusCode());
        
        Map<String, Object> resMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        String loginId = (String) resMap.get('sub');
        //System.debug('LogggiiiNNN  ID  ->>  '  + loginId);
        return loginId;
    }
    public static void postMessage(String loginId, String postMessage){
        Http ht = new Http();
        Httprequest req = new Httprequest();
        req.setMethod('POST');
        req.setHeader('X-Restli-Protocol-Version', '2.0.0');
        req.setHeader('Content-Type', 'application/json');
        String authorId = 'urn:li:person:' + loginId;
        String linkedInPostBody = '{' +
           ' "author": "'+authorId+'",' +
           ' "lifecycleState": "PUBLISHED",' +
           ' "specificContent": {' +
            '    "com.linkedin.ugc.ShareContent": {' +
            '        "shareCommentary": {' +
                  '      "text": "'+postMessage+'"' +
                '    },' +
               '     "shareMediaCategory": "NONE"' +
               ' }' +
          '  },' +
          '  "visibility": {' +
          '  "com.linkedin.ugc.MemberNetworkVisibility": "PUBLIC"' +
          '  }  '+
       ' }';
        
        req.setBody(linkedInPostBody);
        req.setEndpoint('callout:LinkedIn_Integrate/v2/ugcPosts');
        
        Httpresponse res = ht.send(req);
        System.debug('Getting Response ' + res.getbody());
        System.debug('Getting Response Status Code' + res.getStatusCode());
    }
}