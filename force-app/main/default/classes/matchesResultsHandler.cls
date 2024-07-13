global with sharing class matchesResultsHandler {
    @AuraEnabled(cacheable=true)
    public static List<Games__c> getGameList() {

        List<Games__c> gameList = [SELECT Id, Name, Match_Number__c, Between_Teams__c, 
        Team_Won__c, Result__c FROM Games__c ORDER by Name DESC];

        return gameList;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Games__c> getGameResultByName(String betweenTeams) {
        List<Games__c> gameList = [SELECT Id, Name, Between_Teams__c, Toss_Information__c,
        Toss_Decision__c, Venue__c, Match_Number__c,
        Team_Name_1__r.Name, Overs__c, Total_Run_Scored__c, Run_Rate__c, For_Wicket__c,
        Team_Name_2__r.Name, Overs_Played__c, Run_Scored__c, at_Run_Rate__c, Wicket__c, 
        Team_Won__c, Result__c, Player_Of_the_Match__c FROM Games__c 
        WHERE Between_Teams__c =: betweenTeams];

        return gameList;
    }

    @AuraEnabled(cacheable=true)
    public static List<Games__c> getGameResultByNameByLMS(String resId) {
        List<Games__c> gameList = [SELECT Id, Name, Between_Teams__c, Toss_Information__c,
        Toss_Decision__c, Venue__c, Match_Number__c,
        Team_Name_1__r.Name, Overs__c, Total_Run_Scored__c, Run_Rate__c, For_Wicket__c,
        Team_Name_2__r.Name, Overs_Played__c, Run_Scored__c, at_Run_Rate__c, Wicket__c, 
        Team_Won__c, Result__c, Player_Of_the_Match__c FROM Games__c 
        WHERE Id =: resId];

        return gameList;
    }
}