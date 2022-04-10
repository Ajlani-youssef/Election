pragma solidity >=0.4.22 <0.8.14;

contract Election {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public voters;

    mapping(uint256 => Candidate) public candidates;

    uint256 public candidatesCount;

    event votedEvent (
        uint256 indexed _candidateId
    );

    constructor() public {
        addCandidate("youssef");
        addCandidate("hamdi");
        addCandidate("hamza");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        require(!voters[msg.sender]);

        require(_candidateId > 0 && _candidateId  <= candidatesCount);


        voters[msg.sender] = true;

        candidates[_candidateId].voteCount ++;

        emit votedEvent(_candidateId);
    }
}
