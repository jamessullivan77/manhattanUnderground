
document.addEventListener("DOMContentLoaded",function(){
	var elOccupation = document.querySelector("#ocupation");
	var elOtherInput = document.querySelector("#other_1");
	updateInputVisibility(elOccupation,elOtherInput,"other");
	elOccupation.addEventListener("change",function(event){
		console.log("change detected.")
		updateInputVisibility(elOccupation,elOtherInput,"other");
	});


/* updateInputVisbility will decide whether to 
   show or hide an html element (elTarget) depending
   on whether an option is checked (elTrigger) */
function updateInputVisibility( elTrigger, elTarget, value ) {
	if( elTrigger.value === value ) {
		elTarget.style.display = "block";
	} else {
		elTarget.style.display = "none";
	}
}

// here I am trying to connect the textarea with the submit button. 
// Then when the submit button is clicked, the value of the textarea will 
// then display in the comment space <P> 

var space = document.getElementById("comment_space");
var submit = document.getElementById("comSub");

document.getElementById("comments").addEventListener("submit", 
	function(event){
		event.preventDefault();
		console.log("submit");
		var newComment = document.getElementById("user_textbox").value;

	 	document.getElementById("user_textbox").value = "";

	 	var elNewComment = document.createElement("div");

	 	elNewComment.className = "comment";
	 	elNewComment.id = "msg_" + (space.querySelectorAll(".comment").length+1)

	 	elNewComment.innerText = newComment;

	 	space.appendChild(elNewComment);

});

});