const destinationBtn = document.getElementById("find")
const results = document.getElementById("results")
const result = document.getElementById("result")
let container = document.getElementById("container")
let info = document.getElementById("info")
let again = document.getElementById("try-again")


destinationBtn.addEventListener('click', () => {
    fetch("http://localhost:3000/random_destination")
        .then(res => res.json())
        .then(data => {
            info.className = 'hide'
            results.style.opacity = 1
            results.style.visibility = 'visible'
            result.innerHTML = `<hr>
            <div class="name">${data.name}<br><hr> <span class= "detail"> ${data.detail}<span><br><hr></div>
            <div class = "bor"> ${data.borough}<hr></div>

            <div class = "image"><img src = "${data.image}" alt = "Destination"}></div>`
        })
})