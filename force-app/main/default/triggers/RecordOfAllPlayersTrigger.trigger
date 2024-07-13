trigger RecordOfAllPlayersTrigger on Records_of_All_Players__c (Before Insert, Before Update, Before Delete, After Insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        for(Records_of_All_Players__c roap : Trigger.New){
            if(roap.Out__c == false && roap.Not_Out__c == false){
                roap.Did_Not_Bat__c = true;
            }
        }
        RecordOfAllPlayersTriggerHandler.strikeRateCalculator(Trigger.New);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        RecordOfAllPlayersTriggerHandler.strikeRateCalculator(Trigger.New);
    }
    if(Trigger.isAfter && Trigger.isAfter){
        RecordOfAllPlayersTriggerHandler.calculateAfterInsertOrUpdate(Trigger.New);
    }
    if(Trigger.isBefore && Trigger.isDelete){
        for(Records_of_All_Players__c ap : Trigger.Old){
            ap.addError('Deletion Of Record is not Allowed');
        }
    }
    /*if(Trigger.isAfter && Trigger.isUpdate){
        RecordOfAllPlayersTriggerHandler.calculateAfterInsertOrUpdate(Trigger.New);
    }*/
}