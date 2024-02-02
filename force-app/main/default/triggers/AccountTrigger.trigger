trigger AccountTrigger on Account (after insert) {
    if(Trigger.isInsert && Trigger.isAfter){
        AccountTriggerHandler.getAccountDetails(Trigger.new);
    }
}
