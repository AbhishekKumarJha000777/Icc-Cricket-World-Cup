import { LightningElement, wire } from 'lwc';
import mostWideBall from '@salesforce/apex/IndividualRecordsHandler.mostWideGiven'
import mostNoBall from '@salesforce/apex/IndividualRecordsHandler.mostNoBallGiven'
import mostMaiden from '@salesforce/apex/IndividualRecordsHandler.mostMaidenBowledByABowler'
import mostRunGiven from '@salesforce/apex/IndividualRecordsHandler.mostRunGivenByABowler'
export default class OtherStatsICC extends LightningElement {
    @wire(mostWideBall)
    getMostWideBalls
    @wire(mostNoBall)
    getMostNoBalls
    @wire(mostMaiden)
    getMostMaidens
    @wire(mostRunGiven)
    getMostRuns
}