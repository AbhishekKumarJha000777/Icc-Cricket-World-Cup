import { LightningElement } from 'lwc';
import getPlayerRecordIndividually from '@salesforce/apex/IndividualRecordsHandler.findIndividualPlayer'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class FindEveryPlayerRecordsIndividually extends LightningElement {
    selectPlayer=''
    getIndividualRecordsForEachPlayers
    handleButton() {
        getPlayerRecordIndividually({ playerName : this.selectPlayer })
            .then(result => {
                    if (result === null || result.length === 0) {
                        const event = new ShowToastEvent({
                            title: 'No Data Found',
                            message: 'Please Check the Spelling of Player Name or Enter the Player Name Who is Playing this World Cup..',
                            variant: 'Error'
                        });
                        this.dispatchEvent(event);
                        this.getIndividualRecordsForEachPlayers = ''
                    } else {
                        this.getIndividualRecordsForEachPlayers = result
                    }
            })
            .catch(error => {
                //console.error(error);
                this.showApexErrorToast(error);
            });
    }
    handleChange(event){
        this.selectPlayer = event.target.value
    }
    showApexErrorToast(error) {
        const event = new ShowToastEvent({
            title: 'Apex Error',
            message: error.body.message || 'An error occurred while calling the Apex method.',
            variant: 'error',
        });
        this.dispatchEvent(event);
    }
}