trigger GameTrigger on Games__c (Before Delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        for(Games__c gm : Trigger.Old){
            gm.addError('Deletion of Record is not Allowed!!!');
        }
    }
}