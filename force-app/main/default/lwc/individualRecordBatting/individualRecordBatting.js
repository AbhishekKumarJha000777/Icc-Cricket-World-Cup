import { LightningElement, wire } from 'lwc';
// Most Run's
import getTopFiveRunScorer from '@salesforce/apex/IndividualRecordsHandler.topFiveRunScorer'
export default class IndividualRecordBatting extends LightningElement {
    // To Fetch Top 5 Run Scorer.....
    @wire(getTopFiveRunScorer)
    getTopBatsmanLists
}