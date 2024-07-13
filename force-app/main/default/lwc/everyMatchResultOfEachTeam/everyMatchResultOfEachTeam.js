import { LightningElement } from 'lwc';
import everyMatchResultOfEachTeam from '@salesforce/apex/IndividualRecordsHandler.eachMatchResults'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class EveryMatchResultOfEachTeam extends LightningElement {
    selectTeam=''
    getRecordsOfEachTeamResultForEveryGame
    handleButton() {
        everyMatchResultOfEachTeam({ teamName : this.selectTeam })
            .then(result => {
                    if (result === null || result.length === 0) {
                        const event = new ShowToastEvent({
                            title: 'No Data Found',
                            message: 'Please Check the Spelling of Team Name or Enter the Team that is Playing this World Cup..',
                            variant: 'Error'
                        });
                        this.dispatchEvent(event);
                        this.getRecordsOfEachTeamResultForEveryGame = ''
                    } else {
                        this.getRecordsOfEachTeamResultForEveryGame = result
                    }
            })
            .catch(error => {
                //console.error(error);
                this.showApexErrorToast(error);
            });
    }
    handleChange(event){
        this.selectTeam = event.target.value
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