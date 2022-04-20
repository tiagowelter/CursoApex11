trigger AccountTrigger on Account (after insert) {

    TriggerHandler handler = new AccountTriggerHandler(true);

    switch on Trigger.operationType{
        when BEFORE_INSERT{
            handler.beforeInsert(Trigger.new);
        }
        when BEFORE_UPDATE{
            handler.beforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        }
        when BEFORE_DELETE{
            //handle.beforeInser()
        }     
        when AFTER_INSERT{
            handler.afterInsert(Trigger.old, Trigger.new);
        }     
        when AFTER_UPDATE{
            //handle.beforeInser()
        } 
        when AFTER_DELETE{
            //handle.beforeInser()
        }    
        when AFTER_UNDELETE{
            //handle.beforeInser()
        }                                
    }


}