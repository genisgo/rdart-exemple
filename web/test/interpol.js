

var isInitValue = false;

function isInit() {
    isInitValue = true;
    var p = new Point2D(3, 4);
    console.log(p.distanceToOrigin());
    return isInitValue;
}

function updateUI(seconds) {
    
    
   document.body.innerText = `Counter ${seconds}`

    console.log(`update=>${seconds}`)

}

function showDoneMessage(){
    alert("Termier");
}