pragma solidity >=0.4.22 <0.8.14;

contract Election {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) public candidates;

    uint256 public candidatesCount;

    constructor() public {
        addCandidate("youssef");
        addCandidate("hamdi");
        addCandidate("hamza");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
