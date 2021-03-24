Moralis.initialize("5k8JEsWD06JQZqrQuazn5khyA5xPjfEgOqtW09H6")
Moralis.serverURL = "https://e1s9vhmugh9l.moralis.io:2053/server";

async function submitFile(_file) {
    try {
        let result = await ipfs.add(_file);
        return (result.path);

    } catch (error) { console.log(error); }
}

async function login() {
    try {
        user = await Moralis.User.current();
        if (!user) {
            var user = await Moralis.Web3.authenticate();
        }
    } catch (error) { console.log(error); }
    return ethereum.selectedAddress
}

async function loggedIn() {
    try {
        user = await Moralis.User.current();
    } catch (error) { console.log(error); }
    return ethereum.selectedAddress
}

async function logout() {
    try {
        user = await Moralis.User.logOut();
    } catch (error) { console.log(error); }
}

async function setMeme(_memeHash) {

    sendsettings = {
        from: ethereum.selectedAddress,
        gasLimit: 6721975,
        gasPrice: '20000000000',
    };
    try {
        window.web3 = await Moralis.Web3.enable();
        let contractInstance = new web3.eth.Contract(window.abi, "0xE7E7d0A2133E6980c8D7504A1Cd54B188032Ef1e");
        let receipt = await contractInstance.methods.set(_memeHash).send(sendsettings);
    } catch (error) { console.log(error); }
}

async function getMeme() {

    sendsettings = {
        from: ethereum.selectedAddress,
        gasLimit: 6721975,
        gasPrice: '20000000000',
    };
    try {
        window.web3 = await Moralis.Web3.enable();
        let contractInstance = new web3.eth.Contract(window.abi, "0xE7E7d0A2133E6980c8D7504A1Cd54B188032Ef1e");
        let receipt = await contractInstance.methods.get().call();
        return receipt;
    } catch (error) { console.log(error); }
}