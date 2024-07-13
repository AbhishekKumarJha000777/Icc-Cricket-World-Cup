import { LightningElement, wire } from 'lwc';
import gameList from '@salesforce/apex/matchesResultsHandler.getGameList'
//Lightning Messaging Channel
import GETSCORE from '@salesforce/messageChannel/ScoreCard__c'
import {MessageContext, publish} from 'lightning/messageService'
export default class MatchesResults extends LightningElement {
    @wire(gameList)
    gameListResults

    @wire(MessageContext)
    context

    handleClick(event){
        const selectedId = event.target.dataset.id
        const message = {
            recordId : selectedId
        }
        publish(this.context, GETSCORE, message)
    }
}