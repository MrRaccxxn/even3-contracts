/* global ethers */
/* eslint prefer-const: "off" */

const { getSelectors, FacetCutAction } = require('./libraries/diamond.js')
const { facets } = require('./utils/facets')

async function deployEvent() {
    let facetCuts = []
    const accounts = await ethers.getSigners()
    const contractOwner = accounts[0]

    const DiamondInit = await ethers.getContractFactory('DiamondInit')
    const diamondInit = await DiamondInit.deploy()
    await diamondInit.deployed()
    console.log('DiamondInit deployed:', diamondInit.address)

    for (const facet of facets) {
        const address = await ethers.getContractAt(facet.title, facet.address)
        let selectors = getSelectors(address)
        if (facet.title === 'EventFacet') {
            selectors = getSelectors(address).remove(['supportsInterface(bytes4)'])
        }

        facetCuts.push({
            facetAddress: facet.address,
            action: FacetCutAction.Add,
            functionSelectors: selectors
        })
    }

    let functionCall = diamondInit.interface.encodeFunctionData('init')

    const diamondArgs = {
        owner: contractOwner.address,
        init: diamondInit.address,
        initCalldata: functionCall
    }

    const Diamond = await ethers.getContractFactory('Diamond')
    const diamond = await Diamond.deploy(facetCuts, diamondArgs)
    await diamond.deployed()
    console.log()
    console.log('Diamond deployed:', diamond.address)

    return diamond.address
}

if (require.main === module) {
    deployEvent()
        .then(() => process.exit(0))
        .catch(error => {
            console.error(error)
            process.exit(1)
        })
}

exports.deployEvent = deployEvent
