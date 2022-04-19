trigger AccountTrigger on Account (after insert) {
    system.debug('Executou a trigger');
}