import { LightningElement, wire } from 'lwc';
// Most Run's and Wickets's
import getTopFiveRunScorer from '@salesforce/apex/IndividualRecordsHandler.topFiveRunScorer'
import getTopFiveWicketTaker from '@salesforce/apex/IndividualRecordsHandler.topFiveWicketTaker'

export default class IndividualRecords extends LightningElement {
    // To Fetch Top 5 Run Scorer.....
    @wire(getTopFiveRunScorer)
    getTopBatsmanLists

    // To Fetch Top 5 Wicket Taker.....
    @wire(getTopFiveWicketTaker)
    getTopBallerLists
}