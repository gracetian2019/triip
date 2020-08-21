const destinationBtn = document.getElementById("find")
const results = document.getElementById("results")
const result = document.getElementById("result")
let container = document.getElementById("container")
let info = document.getElementById("info")

let returnBtn = document.createElement("a")
returnBtn.setAttribute("href", "index.html")
returnBtn.id = "returnBtn"
returnBtn.textContent = "Go find another destination"
results.appendChild(returnBtn)

let comments = []
let destinationData


destinationBtn.addEventListener('click', () => {
    fetch("http://localhost:3000/random_destination")
        .then(res => res.json())
        .then(data => {
            info.className = 'hide'
            results.style.opacity = 1
            results.style.visibility = 'visible'
            result.innerHTML = `<hr>
            <div class="name">${data.name}<br><hr> <span class= "detail"> ${data.detail}<span><br><hr></div>
            <div class = "bor" id = "bu"> ${data.borough}<hr></div>
            <div class = "btn" id = "btn-container"></div>
            <div class = "image"><img src = "${data.image}" alt = "Destination"}></div>`
            document.getElementById("btn-container").append(showCommentBtn())
            let commentList = document.createElement("ul")
            commentList.id = "commentList"
            document.getElementById("btn-container").appendChild(commentList)
            comments = data.comments
            destinationData = data

        })

})



function showCommentBtn() {
    let showCommentBtn = document.createElement("BUTTON")
    showCommentBtn.id = "showCommentBtn"
    showCommentBtn.innerHTML = "Show Comment"
    showCommentBtn.addEventListener('click', () => {
        //console.log(comments)
        renderComments()
        document.getElementById("btn-container").appendChild(showFormBtn())
        document.getElementById("showCommentBtn").hidden = true;
        document.getElementById("commentList").hidden = false;
    }, false)
    return showCommentBtn

}


function renderComments() {

    comments.forEach((comment) => {
        renOneComment(comment)
            // console.log(comment)

    })
}

function renOneComment(comment) {
    let commentLi = document.createElement("li")
    document.getElementById("commentList").appendChild(commentLi)
    commentLi.innerHTML = `${comment.content}`
    commentLi.appendChild(deleteBtn(comment))
}

function showFormBtn() {
    let showFormBtn = document.createElement("BUTTON")
    showFormBtn.id = "showFormBtn"
    showFormBtn.innerHTML = "Add Comment"
    showFormBtn.addEventListener('click', () => {
        renderForm(commentForm())
        document.getElementById("showFormBtn").hidden = true;
    }, false)
    return showFormBtn
}

function commentForm() {
    let commentFormContainer = document.createElement("div")
    commentFormContainer.id = "comment-form-container"
    commentFormContainer.innerHTML = `<form id = "comment-form">
    <label for="new-comment">New Comment:</label>
    <textarea id="add-comment" name="add-comment" rows="4" cols="50">
      Write your comment here...
      </textarea>
      <br><br>
      <input type="submit" value="Submit" id = "submitBtn">
    </form>`
    commentFormContainer.addEventListener('submit', (e) => {
        e.preventDefault();
        submitInputComment(e)
        commentFormContainer.reset()
    })
    return commentFormContainer
}


function renderForm(commentFormContainer) {
    document.getElementById("btn-container").appendChild(commentFormContainer)
}

function submitInputComment(e) {
    e.preventDefault();
    console.log(e.target.children[1].value)
    let newContent = `${e.target.children[1].value}`
        //debugger
    console.log(newContent)
    let newComments = {
        content: newContent,
        destination_id: destinationData.id
    }
    console.log(newComments.content)
    fetch('http://localhost:3000/comments', {
            method: 'POST',
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json"
            },
            body: JSON.stringify(newComments)
        })
        .then(res => res.json())
        .then(comment => {
            renOneComment(comment)
            let formContainer = document.getElementById("comment-form-container")
            formContainer.style.display = "none";

        })


}

function deleteBtn(comment) {
    let delBtn = document.createElement("BUTTON");
    delBtn.id = "delBtn"
    delBtn.innerHTML = "X"
        // console.log(comment)
    delBtn.addEventListener('click', (e) => {
        deleteComment(e, comment)
    })
    return delBtn

}

function deleteComment(e, comment) {
    e.preventDefault();
    let targetLi = e.currentTarget.parentElement

    fetch(`http://localhost:3000/comments/${comment.id}`, {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(res => { targetLi.remove() })

}