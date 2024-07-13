trigger AllPayersTrigger on All_Players__c (Before Insert, Before Update, Before Delete) {
    if(Trigger.isBefore && Trigger.isInsert){
        AllPlayersTriggerHandler.strikeRateCalculator(Trigger.New);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        AllPlayersTriggerHandler.strikeRateCalculator(Trigger.New);
    }
    if(Trigger.isBefore && Trigger.isDelete){
        for(All_Players__c ap : Trigger.Old){
            ap.addError('Deletion Of Record is not Allowed');
        }
    }
}