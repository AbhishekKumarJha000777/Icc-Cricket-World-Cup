import { LightningElement, wire, api } from 'lwc';
import getGameResult from '@salesforce/apex/matchesResultsHandler.getGameResultByNameByLMS'
import GETSCORE from '@salesforce/messageChannel/ScoreCard__c'
import {subscribe, MessageContext, APPLICATION_SCOPE} from 'lightning/messageService'
export default class GetScoreCardFromLMSmatchResults extends LightningElement {
    @api recordId
    @wire(getGameResult, {resId : '$recordId'})
    gameResultLists

    @wire(MessageContext)
    context

    connectedCallback(){
        this.subscribeMessage()
    }

    subscribeMessage(){
        subscribe(this.context, GETSCORE, (message)=>{this.handleMessage(message)}, {scope : APPLICATION_SCOPE})
    }

    handleMessage(message){
        this.recordId = message.recordId
    }
}