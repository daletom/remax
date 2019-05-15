function toggleExploreToc() {
	var elm = document.getElementById("explore-toc");
		elm.className = (elm.className === "expanded" ? "" : "expanded");
	return false;
}
function toggleNeighborhoodSection(section) {
	document.getElementById("listing-neighborhood").className = section + "-selected";
	return false;
}

window.onLoad = function() {

}
