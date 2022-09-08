/**
 * 
 */
 
const addBtn = document.querySelector('#add-btn');
const seatsInput = document.querySelector('#totalSeats');

seatsInput.addEventListener('input', () => {
   	let noOfSeats = parseInt(seatsInput.value);
    if(noOfSeats<=19){
    	printError("seat_error", `Seats should be greater than or equal to 20`);
    	addBtn.disabled = true;
    } else{
		addBtn.disabled = false;
		printSuccess("seat_error");
	}
});



function printError(elemId, hintMsg){
	document.getElementById(elemId).innerHTML = hintMsg;
	document.getElementById(elemId).parentElement.classList.add('text-danger');
}
function printSuccess(elemId) {
    document.getElementById(elemId).innerHTML = '';
    document.getElementById(elemId).parentElement.classList.remove('text-danger');
  }