const users = []

const addUser = (id, name, website) => {
    const existingUser = users.find(user => user.name.trim().toLowerCase() === name.trim().toLowerCase())

    if (existingUser) return { error: "Username has already been taken" }
    if (!name && !website) return { error: "Username and website are required" }
    if (!name) return { error: "Username is required" }
    if (!website) return { error: "website is required" }

    const user = { id, name, website }
    users.push(user)
    return { user }
}

const getUser = id => {
    let user = users.find(user => user.id == id)
    return user
}

const deleteUser = (id) => {
    const index = users.findIndex((user) => user.id === id);
    if (index !== -1) return users.splice(index, 1)[0];
}

const getUsers = (website) => users.filter(user => user.website === website)

module.exports = { addUser, getUser, deleteUser, getUsers }