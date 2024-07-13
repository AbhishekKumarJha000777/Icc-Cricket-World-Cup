public with sharing class IndividualRecordsHandler {
    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> topFiveRunScorer() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_Runs_Scored__c,
        Team_Name__r.Name, Total_Ball_Faced__c, Strike_Rate__c, Game_Played__c
        FROM All_Players__c 
        ORDER BY Total_Runs_Scored__c 
        DESC Nulls Last LIMIT 10];
        return allPlayerList;
    }

    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> topFiveWicketTaker() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_Wickets__c,
        Team_Name__r.Name, Total_Overs_Bowled__c, Total_Run_Given__c, Game_Played__c
        FROM All_Players__c ORDER BY Total_Wickets__c 
        DESC Nulls Last LIMIT 10];
        return allPlayerList;
    }

    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> mostFours() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_Fours__c,
        Team_Name__r.Name FROM All_Players__c ORDER BY Total_Fours__c 
        DESC Nulls Last LIMIT 5];
        return allPlayerList;
    }

    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> mostSixes() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_Sixes__c,
        Team_Name__r.Name FROM All_Players__c ORDER BY Total_Sixes__c 
        DESC Nulls Last LIMIT 5];
        return allPlayerList;
    }

    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> mostWideGiven() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_Wide_Ball_Bowled__c,
        Team_Name__r.Name FROM All_Players__c ORDER BY Total_Wide_Ball_Bowled__c 
        DESC Nulls Last LIMIT 1];
        return allPlayerList;
    }

    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> mostNoBallGiven() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_No_Ball_Bowled__c,
        Team_Name__r.Name FROM All_Players__c ORDER BY Total_No_Ball_Bowled__c 
        DESC Nulls Last LIMIT 1];
        return allPlayerList;
    }

    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> mostMaidenBowledByABowler() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_Maiden_Bowled__c,
        Team_Name__r.Name FROM All_Players__c ORDER BY Total_Maiden_Bowled__c 
        DESC Nulls Last LIMIT 1];
        return allPlayerList;
    }

    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> mostRunGivenByABowler() {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Total_Run_Given__c,
        Team_Name__r.Name FROM All_Players__c ORDER BY Total_Run_Given__c 
        DESC Nulls Last LIMIT 1];
        return allPlayerList;
    }


    @AuraEnabled(cacheable=true)
    public static List<All_Players__c> findIndividualPlayer(String playerName) {
        List<All_Players__c> allPlayerList = [SELECT Id, Name, Game_Played__c,
        Strike_Rate__c, Team_Name__c, Total_Ball_Faced__c, Total_Fours__c, Total_Runs_Scored__c,
        Total_Sixes__c, Team_Name__r.Name, Total_Maiden_Bowled__c, Total_No_Ball_Bowled__c, 
        Total_Overs_Bowled__c, Total_Run_Given__c, Total_Wickets__c, Total_Wide_Ball_Bowled__c
        FROM All_Players__c WHERE Name =: playerName];
        return allPlayerList;
    }



    @AuraEnabled(cacheable=true)
    public static List<All_Teams__c> eachMatchResults(String teamName) {
        List<All_Teams__c> matchResults = [SELECT Id, Name, First_Game_Result__c,
        Second_Game_Result__c, Third_Game_Result__c, Fourth_Game_Result__c, 
        Fifth_Game_Result__c, Sixth_Game_Result__c, Seventh_Game_Result__c, 
        Eighth_Game_Result__c, Ninth_Game_Result__c FROM All_Teams__c WHERE 
        Name =: teamName];
        return matchResults;
    }
}