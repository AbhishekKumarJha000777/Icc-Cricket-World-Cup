import { LightningElement, wire } from 'lwc';
import getTopThreeFoursHitter from '@salesforce/apex/IndividualRecordsHandler.mostFours'
import getTopThreeSixesHitter from '@salesforce/apex/IndividualRecordsHandler.mostSixes'
export default class IndividualsRecordsFoursSixesAndOthers extends LightningElement {
    // To Fetch Top 3 Fours Hitter.....
    @wire(getTopThreeFoursHitter)
    getTopFoursHitter

    // To Fetch Top 3 Sixes Hitter.....
    @wire(getTopThreeSixesHitter)
    getTopSixesHitter
}