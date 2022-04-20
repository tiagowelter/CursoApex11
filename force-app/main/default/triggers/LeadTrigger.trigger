trigger LeadTrigger on Lead (before insert, after insert, before update, after update) {

    TriggerHandler handler = new LeadTriggerHandler(true);
    //Coleções executadas nas triggers
    //Trigger.New - contem od dados após a alteração
    //Trigger.Old - contem os dados antes da alteração
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
            handler.afterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        } 
        when AFTER_DELETE{
            //handle.beforeInser()
        }    
        when AFTER_UNDELETE{
            //handle.beforeInser()
        }                                
    }    
}