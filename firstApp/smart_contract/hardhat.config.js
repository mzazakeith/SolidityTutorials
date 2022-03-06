require('@nomiclabs/hardhat-waffle');

module.exports = {
    solidity: "0.8.0",
    networks:{
        ropsten:{
            url:"https://eth-ropsten.alchemyapi.io/v2/uEyXg8TojvwqoL42IK-HnweWkoLhLJ7y",
            accounts:['4e4ef0f3a9ba265679843de965798c0fe0e5503609dbccc95f5f7950cb1f0969'],
        }
    }
}