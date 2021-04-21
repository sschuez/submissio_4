const formSubmission = document.getElementById('submitForm')
// const filter = document.querySelector('#filter');

// Load all event listeners
loadEventListeners();

// Load all event listeners
function loadEventListeners() {
  formSubmission.addEventListener('click', getFormIoContent);
  // filter.addEventListener('keyup', filterLabels);
}

// Search input
const submitForm = document.getElementById('submitForm');
var searchForm = document.getElementById('searchForm');

function getFormIoContent() {
    var http = new XMLHttpRequest();
    
    http.open("GET", searchForm.value, true);

    http.onreadystatechange = function() {
        if(http.readyState == 4 && http.status == 200) {
          
        	const form = JSON.parse(this.responseText);
        	let output = '';

					form.components.forEach((component) => {
						component.components.forEach((subcomponent) => {
							if (subcomponent.values) {
								subcomponent.values.forEach((value) => {
									output += `<tr><th scope="row">${component.label}
											<td>${subcomponent.label}</td>
											<td>${subcomponent.key}</td>
											<td>${value.label}</td>
											<td>${value.value}</td>
											<td>${subcomponent.customConditional}</td>
										</th></tr>`;
								});
							} else {
								output += `
								<tr>
									<th class="collection-item" scope="row">${component.label}</th>
									<td class="collection-item">${subcomponent.label}</td>
									<td class="collection-item">${subcomponent.key}</td>
									<td class="collection-item">n/a</td>
									<td class="collection-item">n/a</td>
									<td class="collection-item">${subcomponent.customConditional}</td>
								</tr>`;
							};
						});						
					});
        	document.getElementById('form').innerHTML = output;
        }
    }
    http.send();
}


// Filter
// function filterLabels(e) {
//   const text = e.target.value.toLowerCase();
//     console.log(text);

//   document.querySelectorAll('.collection-item').forEach(function(tElelement){
//     const item = tElelement.firstChild.textContent;
//     if(item.toLowerCase().indexOf(tElelement) != -1){
//       tElelement.style.display = 'block';
//     } else {
//       tElelement.style.display = 'none';
//     }
//   });
// }







