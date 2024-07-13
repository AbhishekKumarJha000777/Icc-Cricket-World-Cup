import { LightningElement, track } from 'lwc';
import postToLinkedIn from '@salesforce/apex/LinkedInIntegration.postToLinkedIn';
export default class SalesforceToLinkedInPost extends LightningElement {
    @track inputValue;

    handleInputChange(event) {
        this.inputValue = event.target.value;
    }

    handleSubmit() {
        // Call the Apex method with the input value
        postToLinkedIn({ Message: this.inputValue })
            .then(result => {
                // Handle success
                console.log('Apex method executed successfully: ' + result);
            })
            .catch(error => {
                // Handle error
                console.error('Error invoking Apex method: ' + error);
            });
    }
}