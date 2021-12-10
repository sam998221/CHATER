const app = require('express')();
const http = require('http').createServer(app);
const io = require('socket.io')(http);
const cors = require('cors');
const PORT = process.env.PORT || 8888;
const { addUser, getUser, deleteUser, getUsers } = require('./users');

app.use(cors())

io.on('connection', (socket) => {
    console.log("connect")
    socket.on('start', ({ name, website }, callback) => {
        const { user, error } = addUser(socket.id, name, website)
        if (error) return callback(error)
        socket.join(user.website)
        socket.in(website).emit('notification', { title: 'Someone is here', description: `${user.name} just entered` })
        io.in(website).emit('users', getUsers(website))
        callback()
    })
    socket.on('sendMessage', message => {
        const user = getUser(socket.id)
        io.in(user.website).emit('message', { user: user.name, text: message });
    })

    socket.on("disconnect", () => {
        console.log("User disconnected");
        const user = deleteUser(socket.id)
        if (user) {
            io.in(user.website).emit('notification', { title: 'Someone just left', description: `${user.name} just left the room` })
            io.in(user.website).emit('users', getUsers(user.website))
        }
    })
})

app.get('/', (req, res) => {
    res.send("Server is up and running")
})

http.listen(PORT, () => {
    console.log(`Listening to ${PORT}`);
})