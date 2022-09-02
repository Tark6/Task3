import { LightningElement,api } from 'lwc';
import topFive from '@salesforce/apex/task3Methods.topFive';

export default class Task3_redtag extends LightningElement 
{
    @api recordId

    opps = [];

    connectedCallback()
    {
        console.log('callback called');
        topFive({accId: this.recordId}).then((res) => {
            this.opps = res;
        });
    }

    get data()
    {
        return this.opps.map(opp => { return { ...opp, link: '/' + opp.Id}})
    }

    cols = [
        {
            label : 'Opportunity',
            fieldName : 'link',
            type: 'url',
            typeAttributes:
            {   
                label:
                {
                     fieldName: 'Name'
                }
            }
        },
        {
            label: 'Stage',
            fieldName: 'StageName'
        },
        {
            label: 'Close Date',
            fieldName: 'CloseDate'
        },
        {
            label : 'Value',
            fieldName : 'Amount'
        }
    ];
}