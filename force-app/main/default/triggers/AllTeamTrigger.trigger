trigger AllTeamTrigger on All_Teams__c (Before Delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        for(All_Teams__c at : Trigger.Old){
            at.addError('Deletion of Record is not Allowed!!!');
        }
    }
}