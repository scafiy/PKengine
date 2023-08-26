enum State {
    STARTMENU,
    OVERWORLD,
    BATTLE
}

private ArrayList<State> stateStack = new ArrayList<State>();




void pushState(State newState) {
    int indexToRemove = stateStack.indexOf(newState);
    
    if (indexToRemove >= 0) {
        stateStack.remove(indexToRemove);  // Remove the state with the specified value
        stateStack.add(newState);          // Add the new state
    }
}

void draw(){

    if (stateStack.get(0) == State.STARTMENU) {
        startMenu();
    } else if (stateStack.get(0) == State.OVERWORLD) {
        overWorld();
    }

    else if(stateStack.get(0) == State.BATTLE){
        battle();
    }
}
