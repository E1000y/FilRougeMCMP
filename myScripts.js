// fonction appelé quand on click sur le menu burger
function clickBurger() {
    // // get la sidevav
    // let sidenav = document.getElementsByClassName('sidenav')[0];
    // // si la sidenav est déja affichée => display: none;
    // if (sidenav.style.display === "block") {
    //     sidenav.style.display = "none";
    // } else {
    //     // sinon => display: block;
    //     sidenav.style.display = "block";
    // }

    //-----code de test pour basculer la deuxième class de sidenav entre show et hide
    let sidenav2 = document.getElementById('sidenav')

    sidenav2.classList.toggle('hide');

    sidenav2.classList.toggle('show');



}

// var dropdown = document.getElementsByClassName("dropdown-btn");


// for (let i = 0; i < dropdown.length; i++) {
//     dropdown[i].addEventListener("click", function () {
//         this.classList.toggle("active");
//         var dropdownContent = this.nextElementSibling;
//         if (dropdownContent.style.display === "block") {
//             dropdownContent.style.display = "none";
//         } else {
//             dropdownContent.style.display = "block";
//         }
//     });
// }

