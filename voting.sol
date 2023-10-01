// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    address public owner;
    uint256 public totalVotes;
    
    struct Voter {
        bool isRegistered;
        bool hasVoted;
    }
    
    mapping(address => Voter) public voters;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier onlyRegisteredVoter() {
        require(voters[msg.sender].isRegistered, "You are not a registered voter");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerVoter(address _voter) public onlyOwner {
        require(!voters[_voter].isRegistered, "Voter is already registered");
        voters[_voter].isRegistered = true;
    }

    function vote() public onlyRegisteredVoter {
        require(!voters[msg.sender].hasVoted, "You have already voted");
        voters[msg.sender].hasVoted = true;
        totalVotes++;
    }

    function getVoteCount() public view returns (uint256) {
        return totalVotes;
    }
}


Here's a breakdown of the code:

We declare the VotingSystem contract with state variables, including an owner address, a totalVotes counter, and a mapping to store information about registered voters.

We define a Voter struct to keep track of whether a voter is registered and has voted.

We create two modifiers:

onlyOwner: Ensures that only the contract owner can call certain functions.
onlyRegisteredVoter: Ensures that only registered voters can interact with voting-related functions.
In the constructor, we set the owner to the address that deploys the contract.

The registerVoter function allows the contract owner to register new voters by adding their addresses to the voters mapping.

The vote function allows registered voters to cast their votes, and it increments the totalVotes counter.

The getVoteCount function allows anyone to retrieve the current vote count.

To deploy this contract on the Swisstronik testnet, you would need to use a development environment like Remix or a command-line tool like Truffle. You would also need testnet Ether for deployment and transactions.



Sign-up on techFiesta and register for the challenge
Join the Swisstronik Discord 
Create an account in the Swisstronik Dev’s Dashboard to confirm your eligibility
Develop the Voting Smart contract and deploy it to the Swisstronik testnet (Here is a guideline on how to deploy on the Swisstronik testnet)
Make sure to input the Contract address of the deployed voting smart contract on the Swisstronik testnet in the Read.me file of the Github repository
Head back to techFiesta to submit the Github repo link
Submit your necessary details here: https://link.swisstronik.com/rk0 

fabian@webworx.co.ke
DVgib5U9zHkXWVz

