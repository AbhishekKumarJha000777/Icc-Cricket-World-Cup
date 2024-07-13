trigger OrderDetailsTrigger on Order_Details__c (Before Insert, Before Update) {
    if(Trigger.isBefore && Trigger.isInsert || Trigger.isUpdate){
        /*Set<Id> ids = new Set<Id>();
        for(Order_Details__c od : Trigger.New){
            ids.add(od.Veg_Main_Course_Name__c);
        }*/
        /*List<Order_Details__c> odList = [SELECT Id, Name, Veg_Bill_Price__c, Veg_Main_Course_Name__r.Total_Veg_Bill__c
                                         FROM Order_Details__c];
        for(Order_Details__c ord : odList){
            ord.Veg_Bill_Price__c = 1;
        }*/
    }
}