import { LightningElement,track, wire } from 'lwc';
import ffApexmethod from '@salesforce/apex/ffApex.ffApexmethod';

const columns = [
    { label: 'ID', fieldName: 'id' },
    { label: 'Title', fieldName: 'title'},
    { label: 'Release date', fieldName: 'release_date', type: 'date', typeAttributes: {  
        day: 'numeric',  
        month: 'short',  
        year: 'numeric',  
        }},
    { label: 'Opening Revenue', fieldName: 'opening_revenue'},
];

export default class FfLwc extends LightningElement {
    @track data = [];
@track columns = columns;
@track tableLoadingState = true;
      
    buttonHandler(){
      
         ffApexmethod().then(movielist=>{
     this.data=movielist;
         })
         .catch(error => {
            this.error = error;
        });
    }
}