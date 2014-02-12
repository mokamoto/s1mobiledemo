global class InternalEventController{

    InternalEvent__c event;
    
    public InternalEventController(ApexPages.StandardController controller) {
            event = (InternalEvent__c) controller.getRecord();
            
            
    }

    ID[] ieAttendees = new ID[]{};

    public PageReference test() {
        return null;
    }
    
    public List<SelectOption> getUsers() {
        List<SelectOption> options = new List<SelectOption>();
        //String needs = event.needs__c;
        //String skillId = [select id, name from profileskill where name = :needs][0].id;
        //System.debug('SkillId: ' + skillId);
        List<User>selectedUsers = [select name from user where id in (select userId from profileskilluser where profileskillid='0Skx00000000014')];
        for(User u : selectedUsers){
            options.add(new SelectOption(u.Id,'田中 弘'));
            options.add(new SelectOption(u.Id,'香坂 保'));
            options.add(new SelectOption(u.Id,'橋下 一平'));
            options.add(new SelectOption(u.Id, u.name));
        }
        return options;
    }

    
    public String[] getAttendees() {
        return ieAttendees;
    }

    public void setAttendees(Id[] ieAttendees) {
        this.ieAttendees = ieAttendees;
    }
    
    @remoteAction
    global static Task createTaskAndPost(){
        Task t = new Task();
        t.ActivityDate = System.date.today().adddays(2);
        t.Subject = 'この社内行事の参加可否を返事をして下ください';
        t.OwnerId = '005x0000000EhMD';
        t.WhatId = 'a00x0000001EueP';
        insert t;
        
        return t;
    }
}