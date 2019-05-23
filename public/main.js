$(function () {
    const ws = new WebSocket("ws://localhost:9292/socket")

    $('button').on('click', evt => {
        ws.send(evt.target.id)
    })

    const move = (plane_id, destination) => {
        $(`#${plane_id}`).detach().appendTo(`#${destination}`)
    }

    ws.onmessage = (msg) => {
        move(...msg.data.split("|"))
    }
})