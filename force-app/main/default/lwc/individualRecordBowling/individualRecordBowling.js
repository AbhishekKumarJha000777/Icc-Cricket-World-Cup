import { LightningElement, wire } from 'lwc';
// Most Wickets's
import getTopFiveWicketTaker from '@salesforce/apex/IndividualRecordsHandler.topFiveWicketTaker'
export default class IndividualRecordBowling extends LightningElement {
    // To Fetch Top 5 Wicket Taker.....
    @wire(getTopFiveWicketTaker)
    getTopBallerLists
}