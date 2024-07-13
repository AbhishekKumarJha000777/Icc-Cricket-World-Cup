import { LightningElement, wire, api } from 'lwc';
import getCustomerDetailsList from '@salesforce/apex/CustomerDetails.getCustomerDetails'
export default class GetCustomerDetails extends LightningElement {
    @api recordId
    @wire(getCustomerDetailsList, {custIds:'$recordId'})
    customerDetails
}